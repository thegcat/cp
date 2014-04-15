require "services_test_helper"
require "project_creator"

describe ProjectCreator do
  let(:project_params) {{name: "Some project"}}
  let(:project_store) {Minitest::Mock.new}

  before do
    @project_creator = ProjectCreator.new(project_store)
  end

  it "must pass project parameters" do
    project_store.expect :create, true, [project_params]
    @project_creator.process(project_params)
    project_store.verify
  end

  it "must bubble up errors" do
    def project_store.create(*args)
      raise StandardError
    end

    proc {@project_creator.process({})}.must_raise(ProjectCreator::CreationError)
  end
end
