# frozen_string_literal: true

require_relative 'hexlet_code'

User = Struct.new(:name, :job, :gender, :status, keyword_init: true)
#user = User.new job: 'hexlet', gender: 'm', status: true

def a
  user = User.new job: 'hexlet', gender: 'm', status: true
  a = HexletCode.form_for user do |f|
    f.input :name, as: :text, rows: 50, cols: 50
    f.input :status, as: :checkbox
    f.input :job
    f.submit
  end
end

puts a

