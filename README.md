# Administrate::Field::Tags

A plugin for tag-like functionality in [Administrate](https://github.com/thoughtbot/administrate)

## Installation

Add to your `Gemfile`:

```ruby
gem "administrate-field-tags"
```

Run:

```bash
$ bundle install
```

# Usage

Assuming you have a model called `Foo`, which has many tags called `Bar`

Add to your `Foo` model:

```ruby
accepts_nested_attributes_for :bars
```

Add to your `FooDashboard`:

```ruby
ATTRIBUTE_TYPES = [
  bars: Administrate::Field::Tags,
]
```

Also add the permitted params to the `FooDashboard`

```ruby
def permitted_attributes
  super + [foo_ids: [], foos_attributes: [:name]]
end
```

By default, the plugin will attempt to get a list of allowed tags by running `Bar.all`, assuming the human-readable name of each `Bar` is `name` and the ID is `id`.

If you want to change this behaviour, you can set options in your `FooDashboard` so:

```ruby
ATTRIBUTE_TYPES = [
  bars: Administrate::Field::Tags.with_options(tag_list: FooTag.everything, id: :identifier, name: :title),
]
```

Where `tag_list` is code to fetch a list of all possible tags, `id` is the ID of the tags, and `name` is the human-readable name of each tag.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wearefuturegov/administrate-field-tags. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
