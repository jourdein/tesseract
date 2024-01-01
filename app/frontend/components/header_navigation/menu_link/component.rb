module HeaderNavigation
  class MenuLink::Component < ApplicationViewComponent
    private

    def menus
      ['About', 'Services', 'Pricing', 'Contact']
    end
  end
end
