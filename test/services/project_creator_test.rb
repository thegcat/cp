require "services_test_helper"
require "chili_project/project_creator"

describe ChiliProject::ProjectCreator do
  let(:project_params) {{name: "Some project"}}
  let(:project_store) {MiniTest::Mock.new}

  before do
    @project_creator = ChiliProject::ProjectCreator.new(project_store)
  end

  it "must pass project parameters" do
    project_store.expect :create, true, [project_params]
    @project_creator.process(project_params)
    project_store.verify
  end
end
