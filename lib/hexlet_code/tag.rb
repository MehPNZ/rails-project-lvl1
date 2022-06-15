# frozen_string_literal: true

module HexletCode
  TAGS_PAIR = %w[div].freeze

  def self.form_for(_obj, url = nil, &block)
    action = url.nil? ? '#' : url[:url]
    Tag.build('form', action: action, method: 'post', &block)
  end

  class Tag
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
