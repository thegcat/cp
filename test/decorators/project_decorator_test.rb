require 'decorators_test_helper'
require 'project_decorator'

describe ProjectDecorator do
  let (:project) {FactoryGirl.build_stubbed(:project)}
  let (:subject) {ProjectDecorator.new(project)}

  describe "#name_or_default" do
    it "should provide a default when the name is empty" do
      project.name = ""
      project.id = 3
      assert_equal 'Project #3', subject.name_or_default
    end
  end
end
