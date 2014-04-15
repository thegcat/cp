class ProjectDecorator < Draper::Decorator
  # Stuff needed for Rails magic
  delegate :to_key, :persisted?

  delegate :id, :name

  def name_or_default
    object.name.presence || h.t('projects.singular_with_number', id: object.id)
  end

  def named_link
    h.link_to(name_or_default, object, class: html_class)
  end

  def html_class
    "project-#{id}"
  end
end
