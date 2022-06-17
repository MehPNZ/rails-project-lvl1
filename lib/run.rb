# frozen_string_literal: true

require_relative 'hexlet_code'
# require "active_support"
# class User < Struct.new(:name, :job, :gender, keyword_init: true) do

# end

# User = Struct.new(:name, :job, :gender, keyword_init: true) do
#   # User = Struct.new(:name, :job, :gender, keyword_init: true)
#   include HexletCode

# end

User = Struct.new(:name, :job, :gender, keyword_init: true) do
  include HexletCode
end

user = User.new name: 'rob', job: 'hexlet', gender: 'm'

a = HexletCode.form_for user do |f|
  f.input :name
  # # f.input :job, as: :text
  # f.input :age
end

puts a
