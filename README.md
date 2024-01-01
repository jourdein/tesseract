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

## READINGS

### REALTIME
- [Mercure Hub](https://mercure.rocks/docs/ecosystem/awesome#examples)

- [Turbo Train](https://github.com/Uscreen-video/turbo-train)

- [Fastly-Fanout-Pushpin](https://www.fastly.com/blog/fastly-fanout-why-real-time-messaging-and-edge-computing-are-an-amazing-combination)\
“Fanout provides an Open Source implementation named Pushpin”
