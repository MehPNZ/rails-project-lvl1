# frozen_string_literal: true
require 'test_helper'
require_relative '../lib/hexlet_code'
require_relative '/Users/aleksandrmihailov/Hexlet/Project_1/rails-project-lvl1/lib/hexlet_code/tag.rb'
#include HexletCode
#include HexletCode


class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build
    assert_equal '<br>', HexletCode::Tag.build('br')
    assert_equal %(\n<img src="path/to/image">\n), HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal %(\n<input type="submit" value="Save">\n), HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal %(<label>Email</label>\n), HexletCode::Tag.build('label') { 'Email' }
    assert_equal %(<label for="email">Email</label>\n), HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end

  class User < Struct.new(:name, :job, :gender, keyword_init: true)
    include HexletCode
  end

  def test_form_for
    user = User.new name: 'rob'
    assert_equal %(<form action="/users" method="post"></form>\n), HexletCode.form_for(user, url: '/users') {}
    assert_equal %(<form action="#" method="post"></form>\n), HexletCode.form_for(user) {}
  end
  
  
  def test_input_with_url
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "test/fixture/input_with_url.html"
    if File.exist?(file_path)
      f = File.new(file_path, "r:UTF-8")
      test_file = f.read
      f.close
    end
    result = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal test_file, result
  end

  def test_input_not_url
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "test/fixture/input_not_url.html"
    if File.exist?(file_path)
      f = File.new(file_path, "r:UTF-8")
      test_file = f.read
      f.close
    end
    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal test_file, result
  end

    def test_input_not_as
      user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  
      file_path = "test/fixture/input_not_as.html"
      if File.exist?(file_path)
        f = File.new(file_path, "r:UTF-8")
        test_file = f.read
        f.close
      end
      result = HexletCode.form_for user do |f|
        f.input :name
      end

    assert_equal test_file, result
  end
end
