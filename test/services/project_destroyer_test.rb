require 'services_test_helper'
require 'project_destroyer'

describe ProjectDestroyer do
  let(:project_store) {Minitest::Mock.new}
  let(:some_project) {Minitest::Mock.new}
  let(:some_project_id) {124}

  before do
    project_store.expect :find, some_project, [some_project_id]
    some_project.expect :destroy, some_project

    @project_destroyer = ProjectDestroyer.new(project_store)
  end

  let(:action) {lambda {@project_destroyer.process(some_project_id)}}

  it 'must find the correct project' do
    action.call
    project_store.verify
  end

  it 'must return the correct project' do
    skip "mocks can't be assert_same-d, so I guess I probably don't want a mock here?"
    p = action.call
    assert_same p, some_project
  end

  it 'must delete the project' do
    action.call
    some_project.verify
  end
end
