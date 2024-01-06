# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.1.1/flowbite.turbo.min.js"
pin_all_from "app/frontend/components", preload: true
