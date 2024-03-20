# frozen_string_literal: true

require_relative "create_or_update/version"
require "updatable/railtie" if defined?(Rails)

module CreateOrUpdate
  class Error < StandardError; end

  extend ActiveSupport::Concern

  included do
    class_attribute :identifiers
  end

  class_methods do
    def identifier(*attrs)
      self.identifiers = attrs
    end

    def create_or_update(attributes)
      attributes.symbolize_keys!

      record = find_by(attributes.slice(*identifiers)) || new

      record.assign_attributes(attributes)
      record.save

      record
    end
  end

  # Your code goes here...
end
