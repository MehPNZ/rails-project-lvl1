# frozen_string_literal: true

module HexletCode
  # class Tag
  class Tag
    TAGS_PAIR = %w[div].freeze
    class << self
      def build(tag, *attributes, &block)
        block.nil? ? to_html(tag, attributes) : %(#{to_html(tag, attributes)}#{yield}</#{tag}>)
      end

     private

      def to_html(tag, attributes, &block)
        if TAGS_PAIR.include?(tag)
          return %(<#{tag}></#{tag}>) unless attributes.any? && block.nil? == true
        else
          return %(<#{tag}>) unless attributes.any?

          arr = []
          attrs, * = attributes
          attrs.each_pair { |key, value| arr << %(#{key}="#{value}") }
          %(<#{tag} #{arr.join(' ')}>)
        end
      end
   end
  end
end
