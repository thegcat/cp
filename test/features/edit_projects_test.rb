require "test_helper"

feature "Edit Projects" do
  scenario "change my name" do
    project = FactoryGirl.create(:project)
    visit project_path(project)
    within '.project' do
      click_on 'Edit'
    end
    within '.project.edit' do
      fill_in 'project_name', with: 'Such project!'
      click_on 'Save'
    end
    assert_equal 'Such project!', project.reload.name
  end
end
