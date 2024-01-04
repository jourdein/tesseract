class BreadcrumbNavigation::Component < ApplicationViewComponent
  # option :page_title, default: proc { "Title is unsets" }
  option :page_title, optional: true
end
