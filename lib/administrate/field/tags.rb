require 'rails'
require 'administrate'
require 'administrate/field/base'

module Administrate
  module Field
    class Tags < Administrate::Field::Base
      class Engine < ::Rails::Engine
        Administrate::Engine.add_javascript(
          'administrate-field-tags/application'
        )
        Administrate::Engine.add_stylesheet(
          'administrate-field-tags/application'
        )

        config.assets.paths << File.expand_path('../../../node_modules', __dir__)
      end

      def tag_options
        options.fetch(:tags, {})
      end

      def id
        tag_options[:id] || :id
      end

      def name
        tag_options[:name] || :name
      end

      def tag_list
        tag_options[:tag_list] || -> { attribute_class.send(:all) }
      end

      def attribute_class
        attribute_name.classify.constantize
      end

      def pluralized_attribute_name
        attribute.to_s
      end

      def attribute_name
        attribute.to_s.singularize
      end

      def as_array
        data.map { |d| d.send(name) }.join(',')
      end

      def tags
        tag_list.call.map do |t|
          {
            id.to_s => t.send(id),
            name.to_s => t.send(name)
          }
        end.to_json
      end
    end
  end
end
