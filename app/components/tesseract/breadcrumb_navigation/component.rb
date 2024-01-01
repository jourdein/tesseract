module Tesseract
  class BreadcrumbNavigation::Component < Tesseract::BaseComponent
    option :page_title, default: proc { "Title is unsets" }
  end
end
