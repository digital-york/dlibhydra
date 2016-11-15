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
-- -- for archbishs I used predicates for 'authorities' and HABM for actual nested objects
-- -- the more I think about it the more I think this approach is wrong and that HABM should always be used for related objects, 
if the related object is a resource in our repo - Hydra knows how to deal with such objects, whereas it has no idea if it's just a normal property
-- -- will need to change in researchdatayork; this would also make it easier to switch between objects and triplestore and external
-- authorities / persons / etc. - Fedora objects or triplestore? what about third-party terms, live look-up or local cache

HABM - current approaches

HABM creator_resource is dcterms creator
-- creator maps is dc11 creator
-- on save, creator_value is added to solr with the preflabel of the creator object

HABM subject_resource = dcterms subject
subject_value in solr with preflabel of related concept object
dc11 subject used for free-text keywords
could also leave dcterms subject open for URIs (would this work?)

HABM for theses metadata approach:
-- local predicates for the HABM because UKETD is looking for strings
-- normal predicates populated on save with the preflabel from the HABM objects
-- strings MUST NOT be added directly

Cardinality - prefer multi-value fields over singular for works. Cases where singular can be used, include:
 
 UUIDs - eg. there can only be one PURE UUID
 information derviced from other systems - eg. Archivematica fields
 some dates - eg. award date and date of last access
 
 Many fields for authorities (concepts, people) are singular


Decisions:
-- authorities MUST have a preflabel; works must have a title
-- use HABM for related objects that aren't covered by PCDM members / files
-- use HYDRA wg recommendation for rights

Generator

rails generate dlibhydra:auths

to force overwrite

rails generate dlibhydra:auths -f

