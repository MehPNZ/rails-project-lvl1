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
      result = yield(obj).map { |el| "\n  #{el}" }.join.squeeze("\n")
      Tag.build('form', action: action, method: 'post') { result }
    rescue StandardError
      Tag.build('form', action: action, method: 'post', &block)
    end
  end

  def input(obj, as_type = nil)
    @tags << Tag.build('label', for: obj.to_s) { obj.to_s.capitalize }
    if as_type.nil?
      @tags << if public_send(obj).nil?
                 Tag.build('input', name: obj.to_s, type: 'text')
               else
                 Tag.build('input', name: obj.to_s, type: 'text', value: public_send(obj))
               end
    else
      set_as obj, as_type
    end
  end

  def submit
    @tags << Tag.build('input', name: 'commit', type: 'submit', value: 'Save')
  end

  def set_as(obj, as_type)
    raise ArgumentError, "Undefined as: #{as_type[:as]}" unless as_type.fetch(:as) == :text

    @tags << Tag.build('textarea', cols: 20, rows: 40, name: obj.to_s) { public_send(obj) }
  end

  class Error < StandardError; end
end
