require "test_helper"

class ProjectsRoutingTest < ActionDispatch::IntegrationTest
  def test_create
    assert_routing(
      {method: 'post', path: '/projects'},
      {controller: 'projects', action: 'create'}
    )
    assert_routing(
      {method: 'post', path: '/projects.xml'},
      {controller: 'projects', action: 'create', format: 'xml'}
    )
  end

  def test_update
    assert_routing(
      {method: :put, path: '/projects/124'},
      {controller: 'projects', action: 'update', id: '124'}
    )
    assert_routing(
      {method: :put, path: '/projects/124.json'},
      {controller: 'projects', action: 'update', id: '124', format: 'json'}
    )
  end
end
