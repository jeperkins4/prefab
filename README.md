Prefab
======
[![Build Status](https://travis-ci.org/jeperkins4/prefab.png?branch=master)](https://travis-ci.org/jeperkins4/prefab)

Prefab provides [Twitter Bootstrap](http://getbootstrap.com/), jQuery Datatable, Spreadsheet, and Service class generators for Rails 5 (supported Rails >= 5.0.1). Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites.

This gem is heavily inspired by [Bootstrap-generator](https://github.com/decioferreira/bootstrap-generators).  This gem began as a fork of his project, but then took on a life of its own.

## Current Twitter Bootstrap version

The current version of Twitter Bootstrap is 3.1.1.

## Installing Gem

In your Gemfile, add this line:

    gem 'prefab', '~> 1.0.2'

Or you can install from latest build:

    gem 'prefab', :git => 'git://github.com/jeperkins4/prefab.git'

Run bundle install:

    bundle install

## Generators

Get started:

    rails generate prefab:install -f

Once you've done that, any time you generate a controller or scaffold, you'll get [Bootstrap](http://twitter.github.com/bootstrap/) templates.

### Give it a try

    rails generate scaffold post title body:text published:boolean

You can easily customize colors, grid system, fonts, and much more by editing `bootstrap-variables.[less|scss]` on your application assets folder.

## Usage

To print the options and usage run the command `rails generate prefab:install --help`

    rails generate prefab:install [options]

    Options:
      -e, [--template-engine=TEMPLATE_ENGINE]       # Indicates when to generate template engine
                                                    # Default: erb
      -se, [--stylesheet-engine=STYLESHEET_ENGINE]  # Indicates when to generate stylesheet engine
                                                    # Default: scss

    Runtime options:
      -f, [--force]    # Overwrite files that already exist
      -p, [--pretend]  # Run but do not make any changes
      -q, [--quiet]    # Supress status output
      -s, [--skip]     # Skip files that already exist

    Copy BootstrapGenerators default files

### Options

#### Template engines

Supported template engines:

* Haml

##### Haml

Add the dependency on your Gemfile:

    gem 'haml-rails'

And then run:

    rails generate prefab:install --template-engine=haml


#### Stylesheet engines

Supported stylesheet engines:

* CSS
* SCSS

Make sure you have `sass-rails` dependency on your Gemfile:

    gem 'sass-rails'

And then run:

    rails generate prefab:install --stylesheet-engine=scss

Now you can customize the look and feel of Bootstrap.

## Assets

### Customize and extend Bootstrap

You will get an `app/assets/stylesheets/prefab-variables.[less|scss]` file with all of the default variables of Bootstrap. This way you can customize the look and feel of Bootstrap without having to download any extra file.

### Javascript

Select all jQuery plugins (`app/assets/javascripts/prefab.js`)

    //= require prefab

## Customizing Templates

In Rails 3.0 and above, generators don’t just look in the source root for templates, they also search for templates in other paths. And one of them is lib/templates.

Since Bootstrap Generators installs its templates under lib/templates, you can go and customize them.

## Credits

* [Twitter Bootstrap](http://getbootstrap.com)
=======
