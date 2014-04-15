require 'test_helper'

feature 'Create projects' do
  scenario 'when the parameters are good' do
    visit new_project_path
    within '.project.new' do
      fill_in 'project_name', with: 'Test'
      click_on 'Create'
    end
    assert Project.exists?(name: 'Test')
  end
end
