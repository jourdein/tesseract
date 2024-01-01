module Tesseract
  module HeaderNavigation
    class MenuLink::Component < Tesseract::BaseComponent
      private

      def menus
        ['About', 'Services', 'Pricing', 'Contact']
      end
    end
  end
end
