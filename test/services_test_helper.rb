require "minitest/autorun"
require "minitest/pride"

services_dir = File.expand_path(File.dirname(__FILE__) + "/../app/services")
$LOAD_PATH.unshift(services_dir) unless $LOAD_PATH.include?(services_dir)
