class ProjectDecorator < Draper::Decorator
  delegate :id

  def name
    object.name || h.t('projects.singular_with_number', id: object.id)
  end

  def named_link
    h.link_to(name, object, {class: "project-#{id}"})
  end
end
