require 'rails_helper'
require 'models'

RSpec.describe PostsController, type: :controller do
  controller do
  end

  before(:each) do
    @zeus = User.create!(name: 'Zeus')
    @hera = User.create!(name: 'Hera')
    User.stamper = @zeus

    @delynn = Person.create!(name: 'Delynn')
    @nicole = Person.create!(name: 'Nicole')

    Person.stamper = @delynn
    define_first_post
  end

  context 'when updating a Post' do
    it 'sets the correct updater' do
      request.session[:person_id] = @delynn.id
      post :update, params: { id: @first_post.id, post: { title: 'Different' } }

      expect(response.status).to eq(200)
      expect(controller.instance_variable_get(:@post).title).to eq('Different')
      expect(controller.instance_variable_get(:@post).updater).to eq(@delynn)
    end
  end

  context 'when handling multiple requests' do
    def simulate_second_request
      old_request_session_user_id = request.session[:person_id]
      request.session[:person_id] = @nicole.id

      post :update, params: { id: @first_post.id, post: { title: 'Different Second'} }
      expect(controller.instance_variable_get(:@post).updater).to eq(@nicole)
    ensure
      request.session[:person_id] = old_request_session_user_id
    end

    it 'sets the correct updater' do
      request.session[:person_id] = @delynn.id
      get :edit, params: { id: @first_post.id }
      expect(response.status).to eq(200)

      simulate_second_request

      post :update, params: { id: @first_post.id, post: { title: 'Different' } }
      expect(response.status).to eq(200)
      expect(controller.instance_variable_get(:@post).title).to eq('Different')
      expect(controller.instance_variable_get(:@post).updater).to eq(@delynn)
    end
  end
end
