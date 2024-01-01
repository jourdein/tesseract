# frozen_string_literal: true

# require_relative "tesseract/helpers/ui_elements_helper"

# require_relative "tesseract/version"
Dir.glob(__dir__ + '/tesseract/*.rb') { |file| require_relative file }
# Dir.glob(__dir__ + '/tesseract/header_navigation.rb') { |file| require_relative file }

module Tesseract
  # autoload :Definition,             File.expand_path("bundler/definition", __dir__)
  # autoload :UiElementsHelper,         File.expand_path("tesseract/helpers/ui_elements_helper", __dir__)

  class << self
    def version
      Tesseract::VERSION
    end
  end
end
