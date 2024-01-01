module HeaderNavigation
  class DropdownMenu::Component < ApplicationViewComponent
    private

    def menu
      ['Dashboard', 'Settings', 'Earnings', 'Sign out']
    end
  end
end
