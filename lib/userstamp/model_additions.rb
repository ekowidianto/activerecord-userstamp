module Userstamp::ModelAdditions
  extend ActiveSupport::Concern

  include Userstamp::Stampable
  include Userstamp::Stamper
end
