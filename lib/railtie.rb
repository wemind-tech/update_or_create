# lib/updatable/railtie.rb
require 'rails/railtie'

module Updatable
  class Railtie < Rails::Railtie

    initializer 'updatable.include_in_application_record' do
      ActiveSupport.on_load(:active_record) do
        ApplicationRecord.include(CreateOrUpdate)
      end
    end
  end
end