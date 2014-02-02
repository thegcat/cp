require "test_helper"

describe ProjectsController do
  let(:project_creator) {MiniTest::Mock.new}
  let(:project_updater) {MiniTest::Mock.new}
  let(:project_destroyer) {MiniTest::Mock.new}
  let(:some_project) {projects(:one)}
  let(:project_params) {{}}

  describe "#new" do
    let(:action) do
      lambda do
        get :new
      end
    end

    before {action.call}

    it {assert_response :success}
    it {assert_template :new}
  end

  describe "#create" do
    let(:action) do
      lambda do
        @controller.stub :project_creation_service, project_creator do
          post :create, {project: project_params}
        end
      end
    end

    describe "when passing valid parameters" do
      let(:project_params) {{"name" => "Some project"}}

      before do
        project_creator.expect :process, some_project, [project_params]
        action.call
      end

      it {project_creator.verify}
      it {assert_response :redirect}
      it {assert_redirected_to project_path(some_project)}
    end

    describe "when project creation fails" do
      before do
        def project_creator.process(*args)
          raise ProjectCreator::CreationError
        end
        action.call
      end

      it {assert_response 422} # Error
    end
  end

  describe "#edit" do
    let(:action) do
      lambda do
        get :edit, id: some_project.id
      end
    end

    before {action.call}

    it {assert_equal assigns(:project), some_project}
    it {assert_response :success}
    it {assert_template :edit}
  end

  describe "#update" do
    let(:action) do
      lambda do
        @controller.stub :project_update_service, project_updater do
          put :update, {id: some_project.id, project: project_params}
        end
      end
    end

    describe "when passing valid parameters" do
      let(:project_params) {{"name" => "Some project"}}

      before do
        project_updater.expect :process, some_project, [some_project.id.to_s, project_params]
        action.call
      end

      it {project_updater.verify}
      it {assert_response :redirect}
      it {assert_redirected_to project_path(some_project)}
    end

    describe "when project update fails" do
      before do
        def project_updater.process(*args)
          raise ProjectUpdater::UpdateError
        end
        action.call
      end

      it {assert_response 422}
    end
  end

  describe "#show" do
    let(:action) do
      lambda do
        get :show, id: some_project.id
      end
    end

    before {action.call}

    it {assert_equal assigns(:project), some_project}
    it {assert_response :success}
    it {assert_template :show}
  end

  describe "#index" do
    let(:action) do
      lambda do
        get :index
      end
    end

    before {action.call}

    it {assert_equal assigns(:projects), [some_project]}
    it {assert_response :success}
    it {assert_template :index}
  end

  describe "#destroy" do
    let(:action) do
      lambda do
        @controller.stub :project_destroy_service, project_destroyer do
          delete :destroy, {id: some_project.id}
        end
      end
    end

    before do
      project_destroyer.expect :process, some_project, [some_project.id.to_s]
      action.call
    end

    it {project_destroyer.verify}
    it {assert_response :redirect}
    it {assert_redirected_to projects_path}
  end
end
