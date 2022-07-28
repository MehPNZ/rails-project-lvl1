# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'
require_relative '../lib/hexlet_code/inputs/text_area'
require_relative '../lib/hexlet_code/inputs/submit'
require_relative '../lib/hexlet_code/inputs/input'
require_relative '../lib/hexlet_code/inputs/label'


class TestHexletCode < Minitest::Test

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def fixture(file_path)
    f = File.new(file_path, 'r:UTF-8')
    test_file = f.read
    f.close
    test_file
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_input_with_as_url
    user = User.new job: 'hexlet', gender: 'm'
    test_file = fixture 'test/fixture/input_with_as_url.html'
    result = HexletCode.form_for user, url: '/users' do |f|
      f.input :name, as: :text, rows: 50, cols: 50
    end
    assert_equal test_file, result
  end

  def test_input_not_url_with_as
    user = User.new job: 'hexlet', gender: 'm'

    test_file = fixture 'test/fixture/input_not_url_with_as.html'

    result = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text, rows: 50, cols: 50
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
