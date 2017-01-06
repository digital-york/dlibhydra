# Dlibhydra

[![Code Climate](https://codeclimate.com/github/digital-york/dlibhydra/badges/gpa.svg)](https://codeclimate.com/github/digital-york/dlibhydra)
[![Issue Count](https://codeclimate.com/github/digital-york/dlibhydra/badges/issue_count.svg)](https://codeclimate.com/github/digital-york/dlibhydra)


Models, vocabularies and behaviours for York Digital Library Hydra applications.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dlibhydra', :git => 'git://github.com/digital-york/dlibhydra.git', branch: 'master'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dlibhydra

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dlibhydra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Generators

To add dlibhydra authorities into your application:

    $ rails generate dlibhydra:auths

force overwrite

    $ rails generate dlibhydra:auths -f
    
To add a default depositor to your application:

    $ rails generate dlibhydra:depositor USERNAME_OF_DEPOSITOR

## Decisions

* authorities MUST have a preflabel; works/collections must have a title; FileSets either are optional
* use has_and_belongs_to_many (HABM) for related objects aren't PCDM members / files (eg. Agents, Places)
* use Hydra metadata working group recommendation for rights
* use _resource for has_and_belongs_to_many relationships (eg. creator_resource) and _value for an appropriate String value for the related object to be added to solr (eg. creator_value_tesim Lawrence, D.H.)
* where the predicate name is a single word, use _string to distinguish th a String value from a HABM, eg. creator_resource (predicate dc:creator) and creator_string (predicate dc11:creator); otherwise string values and object ids will end up mixed together in a single solr field
* use Dublin Core terms for URIs and related objects, and DC 11 for String values
* prefer multi-value fields over singular for works; use singular where there will only be one value, eg. (some UUIDs, some dates)
