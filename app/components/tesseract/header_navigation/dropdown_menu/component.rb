module Tesseract
  module HeaderNavigation
    class DropdownMenu::Component < Tesseract::BaseComponent
      private

      def menu
        ['Dashboard', 'Settings', 'Earnings', 'Sign out']
      end
    end
  end
end
