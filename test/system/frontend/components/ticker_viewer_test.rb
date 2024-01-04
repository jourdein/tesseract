# frozen_string_literal: true

require "application_system_test_case"

class TickerViewer::ComponentSystemTest < ApplicationSystemTestCase
  def test_default_preview
    visit("/rails/view_components/ticker_viewer/default")

    # assert_text "Hello!"
    # click_on("Click me!")
    # assert_text "Good-bye!"
  end
end
