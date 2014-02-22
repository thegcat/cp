require 'base_test_helper'
require 'draper'
require 'factory_girl'
require 'minitest/autorun'

decorators_dir = File.expand_path(File.dirname(__FILE__) + '/../app/decorators')
$LOAD_PATH.unshift(decorators_dir) unless $LOAD_PATH.include?(decorators_dir)
