# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
# module
module HexletCode
  def initialize(_)
    @tags = []

    super
  end

  autoload(:Tag, './hexlet_code/tag')

  def self.form_for(obj, url = nil, &block)
    action = url.nil? ? '#' : url[:url]
    begin
      result = yield(obj).map(&:to_s).join
      Tag.build('form', action: action, method: 'post') { result }
    rescue StandardError
      Tag.build('form', action: action, method: 'post', &block)
    end
  end

  def input(obj, as_type = nil)
    if as_type.nil?
      @tags << Tag.build('input', name: obj.to_s, type: 'text', value: public_send(obj))
    else
      set_as obj, as_type
    end
  rescue NoMethodError => e
    puts e.message
  end

  def set_as(obj, as_type)
    case as_type[:as]
    when :text
      @tags << Tag.build('textarea', cols: 20, rows: 40, name: obj.to_s) { public_send(obj) }
    else raise ArgumentError, "Undefined AS: #{as_type}"
    end
  end

  class Error < StandardError; end
end
