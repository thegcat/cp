# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :minitest do
  watch(%r{^test/.+/(.+)_test\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})                      { |m| "test/*/#{m[2]}_test.rb" }
  watch(%r{^test/.*test_helper\.rb$})
  # Unit tests for pretty much everything in /app
  watch(%r{^app/(.+)\.rb$})                               { |m| "test/#{m[1]}_test.rb" }
  # ApplicationController is a pretty big deal, unit-retest all controllers if changed
  watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
  # Run integration tests when a controller is changed
  # (in addition to controller unit tests already defined before)
  watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| Dir.glob("test/features/*_#{m[1]}_test.rb") }
  # Run integration tests when a view is changed
  watch(%r{^app/views/(.+)/.+$})                          { |m| Dir.glob("test/features/*_#{m[1]}_test.rb") }
  watch(%r{^app/views/(.+)_mailer/.+$})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
  watch(%r{^test/factories/.+\.rb$})                      { 'test' }

  notification :growl
end

guard :bundler do
  watch('Gemfile')
end
