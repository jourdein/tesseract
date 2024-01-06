# frozen_string_literal: true

class ApplicationViewComponent < ViewComponentContrib::Base
  extend Dry::Initializer
  # https://evilmartians.com/chronicles/viewcomponent-in-the-wild-supercharging-your-components#base-classes
  # https://github.com/palkan/view_component-contrib#hanging-initialize-out-to-dry

  private


  #
  # Return string that corresponding to the loaded Stimulus controller module
  # The Stimulus controller is loaded in a customized way. As such,
  # the implementation here must consistence with the implementation in there.
  #
  # Refer file viewcomponent-loading.js where Stimulus controller is automatically loaded
  #
  # @return [String] Matches the loaded Stimulus controller module
  #
  def identifier
    @identifier ||= self.class.name.underscore.dasherize.split("/").join("--")
  end

  alias_method :viewcomponent_name, :identifier
end
