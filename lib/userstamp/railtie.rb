module Userstamp
  class Railtie < Rails::Railtie
    initializer 'userstamp.action_controller' do
      ActiveSupport.on_load(:action_controller_base) do
        include Userstamp::ControllerAdditions
      end

      ActiveSupport.on_load(:active_record) do
        include Userstamp::ModelAdditions

        ActiveRecord::ConnectionAdapters::TableDefinition.include Userstamp::MigrationAdditions
      end
    end
  end
end
