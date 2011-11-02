---
title: My Ruby Development Environment
date: 2011-11-01 23:14:00 +0000
tags: [technology, ruby, development]
---

Setting up your development environment is always a tedious task. My own
environment has changed many times over the years. I've recently gotten my
Ruby-related setup to the point I'm finally really happy with it.

This is by no means a complete in-depth step-by-step guide of how to setup
your environment like mine though. Instead it's meant as a quick reference of
the tools I use, and how I use them. If you were looking for a magical silver
bullet, this article is not it. If you're looking for an exciting adventure
and treasure hunt, this article is hopefully it.


## Ruby

I install and manage multiple Ruby versions with [rbenv][] and [ruby-build][].
They are not as established as [RVM][] which has been around a lot longer, but
I prefer rbenv for it's bare-bones simplicity. If you're coming from RVM, the
main thing that you'll miss is it's gemset feature, which won't be an issue if
you use Bundler properly. There is however a [gemset][rbenv-gemset] plugin
available for rbenv.

To install rbenv, check the [ReadMe][rbenv] on the project page. I prefer the
Git checkout method. [ruby-build][] has installation info on the project page
too, but on OS X I prefer installing it with [Homebrew][].

Once both are installed, you can install your Ruby version of choice, for
example:

    $ rbenv install 1.9.3-p0

Then set your global Ruby version:

    $ rbenv global 1.9.3-p0

I tend to install a very basic set of gems, as all project-specific gems will
be managed by Bundler. So obviously `bundler` needs to be installed:

    $ gem install bundler

With rbenv this does not create the `bundle` executable however, so the next
step is to run:

    $ rbenv rehash

This creates the `bundle` executable in `~/.rbenv/shims`, and also any missing
executables for other gems you have installed.


## Gem Management with Bundler

[Bundler][] is fantastic, but if you just run `bundle install` as default, I would
argue you're not actually using Bundler correctly as it installs the gems into
your Ruby verion's gem path. One of Bundler's great features is that you can
keep gems completely self-contained within a project. For that reason I use
the `--path` option, to install gems into `vendor/bundle` relative to the
Gemfile.

And because I'm lazy, I have a handy bash alias for my `bundle install`
command.

```bash
alias bi="bundle install --path vendor/bundle --binstubs=.bin"
```

The `--binstubs` option there leads me into how I avoid typing `bundle exec`
before every command. It tells Bundler to package binaries from all the
installed gems into a hidden `.bin` directory within the project. Simply add
the following at the very end of your `~/.profile` or `~/.bash_profile`:

```bash
export PATH="./.bin:$PATH"
```

This enables you to call all of the project's gem binaries like normal,
but they're Bundler aware, as if they'd been called with `bundle exec`.

I also have a few bash aliases for `bundle exec ...` which I find useful:

```bash
alias ru="bundle exec ruby"
alias ra="bundle exec rake"
alias rs="bundle exec rspec"
alias ca="bundle exec cap"
alias cu="bundle exec cucumber"
```


## Running Ruby Apps

For running web-based apps I use [Pow][] and/or [Foreman][]. Pow is my
favorite of the two, but for certain projects Foreman is the better match.

I tend to go on a case-by-case basis. For example, some projects might need a
few background workers, I tend to start all of them with Foreman, while I
might run the web-based frontend with Pow.


## MySQL, Redis, and More...

Because I run Mac OS X, I use [Homebrew][] to install things liky [MySQL][],
[Redis][], [Memcache][], and others. If you're not on OS X, you'll have to
find your own preferred way to install these kinds of tools. But I'd imagine
your operating system has some form of package management system you can use.


[homebrew]: http://mxcl.github.com/homebrew/
[rbenv]: https://github.com/sstephenson/rbenv
[ruby-build]: https://github.com/sstephenson/ruby-build
[rbenv-gemset]: https://github.com/jamis/rbenv-gemset
[bundler]: http://gembundler.com/
[mysql]: http://www.mysql.com/
[redis]: http://redis.io/
[memcache]: http://memcached.org/
[rvm]: http://beginrescueend.com/
[pow]: http://pow.cx/
[rack]: http://rack.rubyforge.org/
[foreman]: https://github.com/ddollar/foreman
