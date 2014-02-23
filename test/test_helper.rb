ENV["RAILS_ENV"] = "test"
require 'base_test_helper'
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'minitest/rails/capybara'
