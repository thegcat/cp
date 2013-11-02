require "services_test_helper"
require "chili_project/project_updater"

describe ChiliProject::ProjectUpdater do
  let(:project_params) {{name: "Some other project"}}
  let(:project_store) {MiniTest::Mock.new}
  let(:some_project) {MiniTest::Mock.new}
  let(:some_project_id) {124}

  before do
    project_store.expect :find, some_project, [124]
    some_project.expect :update, true, [project_params]

    @project_updater = ChiliProject::ProjectUpdater.new(project_store)
  end

  let(:action) {lambda {@project_updater.process(some_project_id, project_params)}}

  it "must find the correct project" do
    action.call
    project_store.verify
  end

  it "must return the correct project" do
    skip "mocks can't be asser_same-d, so I guess I probably don't want a mock here?"
    p = action.call
    assert_same(p, some_project)
  end

  it "must update the project attributes" do
    action.call
    some_project.verify
  end

  it "must bubble up errors" do
    def some_project.update(*args)
      raise StandardError
    end

    proc {action.call}.must_raise(ChiliProject::ProjectUpdater::UpdateError)
  end
end
