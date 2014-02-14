# don't even load coveralls outside of Travis
if ENV['TRAVIS']
  require 'coveralls'

  Coveralls.wear! :rails do
    add_group 'Services', 'app/services'
  end
end

require 'minitest/pride'
