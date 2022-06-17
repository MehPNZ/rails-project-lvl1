# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
# module
module HexletCode
  class Error < StandardError; end

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

  def input(obj, attrs = {})
    h_attr = h_attr(obj)

    @tags << Tag.build('label', for: obj.to_s) { obj.to_s.capitalize }

    h_attr[:value] = public_send(obj) unless public_send(obj).nil?

    as?(obj, attrs, h_attr)
  end

  def submit(name = 'Save')
    @tags << Tag.build('input', name: 'commit', type: 'submit', value: name)
  end

  private

  def as?(obj, attrs, h_attr)
    @tags << if attrs.key?(:as)
               set_as(obj, attrs, h_attr)
             else
               Tag.build('input', h_attr.merge(attrs.to_h).sort.to_h)
             end
  end

  def h_attr(obj)
    h_attr = {}
    h_attr[:name] = obj.to_s
    h_attr[:type] = 'text'
    h_attr
  end

  def set_as(obj, attrs, h_attr)
    attrs.delete(:as)
    h_attr.delete(:type)
    h_attr.delete(:value)
    Tag.build('textarea', h_attr.merge(attrs.to_h).sort.to_h) { public_send(obj) }
  end
end
