module Tesseract
  class BaseComponent < ViewComponent::Base
    extend Dry::Initializer # https://evilmartians.com/chronicles/viewcomponent-in-the-wild-supercharging-your-components#base-classes
  end
end
