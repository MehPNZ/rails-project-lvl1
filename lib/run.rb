# frozen_string_literal: true

require_relative 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new job: 'hexlet', gender: 'm'

def a
  user = User.new job: 'hexlet', gender: 'm'
  a = HexletCode.form_for user do |f|
    f.input :name, class: 'class-input'
    f.input :age
    f.input :job, as: :text, rows: 50, cols: 50
    f.submit
    # f.input :name, as: :text, rows: 50, cols: 50
  end
end

puts a
