# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

# class TestHexletCode
class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true) do
    include HexletCode
  end

  def fixture(file_path)
    f = File.new(file_path, 'r:UTF-8')
    test_file = f.read
    f.close
    test_file
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build
    assert_equal '<br>', HexletCode::Tag.build('br')
    assert_equal %(<img src="path/to/image">), HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal %(<input type="submit" value="Save">), HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal %(<label>Email</label>), HexletCode::Tag.build('label') { 'Email' }
    assert_equal %(<label for="email">Email</label>), HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end

  def test_form_for
    user = User.new name: 'rob'
    assert_equal %(<form action="/users" method="post">\n</form>), HexletCode.form_for(user, url: '/users') { '' }
    assert_equal %(<form action="#" method="post">\n</form>), HexletCode.form_for(user) { '' }
  end

  def test_input_with_as_url
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    test_file = fixture 'test/fixture/input_with_as_url.html'

    result = HexletCode.form_for user, url: '/users' do |f|
      f.input :name, as: :text
    end
    assert_equal test_file, result
  end

  def test_input_not_url_with_as
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    test_file = fixture 'test/fixture/input_not_url_with_as.html'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal test_file, result
  end

  def test_input_not_as
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    test_file = fixture 'test/fixture/input_not_as.html'

    result = HexletCode.form_for user do |f|
      f.input :name
    end

    assert_equal test_file, result
  end

  def test_input_submit
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    test_file = fixture 'test/fixture/input_submit.html'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal test_file, result
  end

  def test_input_submit_not_value
    user = User.new job: 'hexlet', gender: 'm'

    test_file = fixture 'test/fixture/input_submit_not_value.html'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal test_file, result
  end
end
