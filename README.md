[![hexlet-check](https://github.com/MehPNZ/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/MehPNZ/rails-project-lvl1/actions/workflows/hexlet-check.yml)
[![CI](https://github.com/MehPNZ/rails-project-lvl1/actions/workflows/makefile.yml/badge.svg)](https://github.com/MehPNZ/rails-project-lvl1/actions/workflows/makefile.yml)

# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

Hexlet_Code aims to be as flexible as possible while helping you with powerful components to create your forms.
## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

Example:
```ruby
HexletCode.form_for user do |f|
  f.input :name
end
```
=> 
```html
<form action="#" method="post">
    ...
  <input name="name" type="text" value="rob">
</form>
```
-------------------------------
Generation with as option

Example:
```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```
=> 
```html
<form action="#" method="post">
    ...
  <input name="name" type="text" value="rob">
  <textarea cols="20" rows="40" name="job">hexlet</textarea>
</form>
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Makefile: 
1. Bundle install: allows you to easily install the necessary gems for your application
2. Run Rubocop: is a Ruby static code analyzer (a.k.a. linter) and code formatter. Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide. Apart from reporting the problems discovered in your code, RuboCop can also automatically fix many of them for you.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MehPNZ/rails-project-lvl1.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
