require "test_helper"

describe ProjectsController do
  let(:project_creator) {MiniTest::Mock.new}
  let(:project_updater) {MiniTest::Mock.new}
  let(:some_project) {projects(:one)}
  let(:project_params) {{}}

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

      it "should pass parameters to the project creation service" do
        project_creator.verify
      end

      it "should redirect to the created project" do
        assert_response :redirect
        assert_redirected_to project_path(some_project)
      end
    end

    describe "when project creation fails" do
      before do
        def project_creator.process(*args)
          raise ChiliProject::ProjectCreator::CreationError
        end
        action.call
      end

      it "should respond with an error" do
        assert_response 422
      end
    end
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

      it "should pass parameters to the project update service" do
        project_updater.verify
      end

      it "should redirect to the updated project" do
        assert_response :redirect
        assert_redirected_to project_path(some_project)
      end
    end

    describe "when project update fails" do
      before do
        def project_updater.process(*args)
          raise ChiliProject::ProjectUpdater::UpdateError
        end
        action.call
      end

      it "should respond with an error" do
        assert_response 422
      end
    end
  end
end
