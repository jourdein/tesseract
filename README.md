## OVERVIEW
Experimenting with Hotwire (HTML Over The Wire)\
Following tutorial from blog: https://blog.cloud66.com/hotwire-viewcomponents-and-tailwindcss-the-ultimate-rails-stack

Key items:
- Rails
- Turbo
- Stimulus

Futher tutorial that use `ViewComponent` with `Lookbook` gem.\
https://content.ophelos.com/post/building-a-component-library-with-viewcomponent-tailwind-and-lookbook

During experimentation, introduces a better integration technologies

- Github [ViewComponents](https://viewcomponent.org/)
- [Lookbook](https://github.com/ViewComponent/lookbook) - UI Dev environment for RoR App
  - Extract some library methods
  - Get some nice ViewComponent design architecture
- [TailwindCSS](https://tailwindcss.com/)
- [Flowbite](https://flowbite.com/application-ui/demo/e-commerce/products/)
  - TailwindCSS through Flowbite
  - Flowbite provides free Figma community design component
  - [Flowbite - Tailwind CSS Figma Design System (Free Edition) (Community)](https://www.figma.com/file/VbIKd1W4Ir8Tk4MWcHVLo9/Flowbite---Tailwind-CSS-Figma-Design-System-(Free-Edition)-(Community)?type=design&node-id=1-82&mode=design&t=DWUf39AUz6I6aQQH-0)
  - Opensource implmentation of Flowbite components
    - https://github.com/themesberg/flowbite-admin-dashboard
    - https://github.com/themesberg/flowbite-astro-admin-dashboard
- use `view_component-contrib` gems

## RUNNING THE APP

```./bin/dev```

Rails come with script to install `foreman`
Could use `overmind` or `hivemind`

Or `npm` with `run-p` package installed to run the processes in parallel

## HOTWIRE RAILS SETUP

### 1. INSTALL RAILS

`rails new chat —skip-javascript`

`gem ‘hotwire-rails’` -  adding Hotwire, you will get Stimulus as well and more

`gem ‘importmap-rails’`

`bundle`

`rails importmap:install`

`rails hotwire:install`

### 2. INSTALL TAILWINDS

`gem ‘tailwindcss-rails’`

`rails tailwindcss:install`

### 3. INSTALL VIEWCOMPONENTS

`gem ‘view_component’`

`‘./app/components/**/*’` [config/tailwind.config.js]

`rails app:template LOCATION="https://railsbytes.com/script/zJosO5"` - auto install gem `view_component-contrib`

[view_component-contrib](https://github.com/palkan/view_component-contrib/tree/master) github

Allows creating view_component generator
  ```
  bundle exec rails g view_component Example

  # see all available options
  bundle exec rails g view_component -h
  ```

Inclusion of gem `dry-initializer` - saving from [a lot of boilerplate](https://github.com/palkan/view_component-contrib#hanging-initialize-out-to-dry)

### ADDITIONAL CONFIGURATIONS

#### To be able to use **importmap**

- Set additional assets path _assets.rb_  \
  `Rails.application.config.assets.paths << Rails.root.join('app/frontend/components')`

- Add line into _manifest.js_  \
  `//= link_tree ../../frontend/components .js`

- Add pin to components js in dir _config/importmap.rb_  \
  `pin_all_from "app/frontend/components", preload: true`

## READINGS

### REALTIME
- [Mercure Hub](https://mercure.rocks/docs/ecosystem/awesome#examples)

- [Turbo Train](https://github.com/Uscreen-video/turbo-train)

- [Fastly-Fanout-Pushpin](https://www.fastly.com/blog/fastly-fanout-why-real-time-messaging-and-edge-computing-are-an-amazing-combination)\
“Fanout provides an Open Source implementation named Pushpin”
