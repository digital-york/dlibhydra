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

## Notes

https://github.com/bblimke/webmock
https://robots.thoughtbot.com/how-to-stub-external-services-in-tests
Factory Girl

Things to do / decide on:
-- add uketd vocab (do full schema?)
-- person / organisation look-ups, has_and_belongs_to_many or normal predicate? (cf. two dc_creator concerns)
-- -- for archbishs I used predicates for 'authorities' and HABM for actual nested objects - seems sensible
-- -- will need to change in researchdatayork; this would also make it easier to switch between objects and triplestore and external
-- authorities / persons / etc. - Fedora objects or triplestore? what about third-party terms, live look-up or local cache
-- check rights against CC and rights recommendation and hydra works rights

creator - how I've approached this for now:

HABM creator_object maps to dcterms creator
-- string value creator maps to dc11 creator
-- on save, add label of object to dc elements creator
-- this way 'creator' is always a string and creator_object is always a reference
downside is that if the person object changes, both values need updating
alternative is index only for the label, then only index needs updating
also need to consider third use case of third party terms - in this case creator object wouldn't work unless we create a local object (do-able / sensible?)


Decisions:
-- MUST have a preflabel; this will be populated to rdfs:label and dc:title on save
-- use HABM for related objects that aren't covered by PCDM members / files

