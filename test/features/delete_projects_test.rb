require 'test_helper'

feature 'Delete Projects' do
  scenario 'it should delete a project' do
    project = FactoryGirl.create(:project)
    visit project_path(project)
    within '.project' do
      click_on 'Delete'
    end
    refute Project.exists?(project.id)
  end
end
