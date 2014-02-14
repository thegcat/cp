require "test_helper"

describe "Project Routes Integration Test" do
  it "routes projects#new" do
    assert_routing(
      {method: :get, path: '/projects/new'},
      {controller: 'projects', action: 'new'}
    )
    assert_routing(
      {method: :get, path: '/projects/new.xml'},
      {controller: 'projects', action: 'new', format: 'xml'}
    )
  end

  it "routes projects#create" do
    assert_routing(
      {method: 'post', path: '/projects'},
      {controller: 'projects', action: 'create'}
    )
    assert_routing(
      {method: 'post', path: '/projects.xml'},
      {controller: 'projects', action: 'create', format: 'xml'}
    )
  end

  it "routes projects#edit" do
    assert_routing(
      {method: :get, path: '/projects/124/edit'},
      {controller: 'projects', action: 'edit', id: '124'}
    )
    assert_routing(
      {method: :get, path: '/projects/124/edit.json'},
      {controller: 'projects', action: 'edit', id: '124', format: 'json'}
    )
  end

  it "routes projects#update" do
    assert_routing(
      {method: :put, path: '/projects/124'},
      {controller: 'projects', action: 'update', id: '124'}
    )
    assert_routing(
      {method: :put, path: '/projects/124.json'},
      {controller: 'projects', action: 'update', id: '124', format: 'json'}
    )
  end

  it "routes projects#index" do
    assert_routing(
      {method: :get, path: '/projects'},
      {controller: 'projects', action: 'index'}
    )
    assert_routing(
      {method: :get, path: '/projects.xml'},
      {controller: 'projects', action: 'index', format: 'xml'}
    )
  end

  it "routes projects#show" do
    assert_routing(
      {method: :get, path: '/projects/124'},
      {controller: 'projects', action: 'show', id: '124'}
    )
    assert_routing(
      {method: :get, path: '/projects/124.xml'},
      {controller: 'projects', action: 'show', id: '124', format: 'xml'}
    )
  end

  it "routes projects#delete" do
    assert_routing(
      {method: :delete, path: '/projects/124'},
      {controller: 'projects', action: 'destroy', id: '124'}
    )
    assert_routing(
      {method: :delete, path: '/projects/124.xml'},
      {controller: 'projects', action: 'destroy', id: '124', format: 'xml'}
    )
  end
end
