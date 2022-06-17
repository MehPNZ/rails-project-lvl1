# frozen_string_literal: true

# module
module HexletCode
  # class Tag
  class Tag
    class << self
      def build(tag, *attributes, &block)
        return %(<#{tag}>) if attributes.empty? && block.nil?
        return %(<#{tag}>#{yield}</#{tag}>) if attributes.empty? && block.nil? == false

        arr = []
        attrs, * = attributes

        attrs.each_pair { |key, value| arr << %(#{key}="#{value}") }
        tag_form_pair(tag, arr, &block)
      end

      private

      def tag_form_pair(tag, arr, &block)
        if tag == 'form'
          %(<#{tag} #{arr.join(' ')}>#{yield}\n</#{tag}>)
        else
          block ? %(<#{tag} #{arr.join(' ')}>#{yield}</#{tag}>) : %(<#{tag} #{arr.join(' ')}>)
        end
      end
    end
  end
end
