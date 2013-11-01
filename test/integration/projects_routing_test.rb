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
end
