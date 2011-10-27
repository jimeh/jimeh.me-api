require 'rubygems'
require 'bundler'

$:.unshift File.expand_path('..', __FILE__)

module Emblog
  class Application

    def self.root(path = nil)
      @_root ||= File.expand_path(File.dirname(__FILE__))
      path ? File.join(@_root, path.to_s) : @_root
    end

    def self.env
      @_env ||= ENV['RACK_ENV'] || 'development'
    end

    def self.routes
      @_routes ||= eval(File.read('./config/routes.rb'))
    end

    # Initialize the application
    def self.initialize!
      Post.initialize!(File.join(self.root, 'posts'))
    end

  end
end

Bundler.require(:default, Emblog::Application.env)

# Preload application classes
Dir['./app/**/*.rb'].each {|f| require f}
