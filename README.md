## OVERVIEW
Experimenting with Hotwire (HTML Over The Wire)\
Following tutorial from
  - blog: https://blog.cloud66.com/hotwire-viewcomponents-and-tailwindcss-the-ultimate-rails-stack
  - code: https://github.com/cloud66-samples/tickerizer

Key items:
- Rails
- Turbo
  - https://www.rubydoc.info/gems/turbo-rails/0.5.2/Turbo%2FBroadcastable:broadcast_replace_to
  - Replace by frame, and replace by stream (http response)
  - Addtionally, using Websocket, replacable by stream on Model
  - https://github.com/hotwired/turbo-rails/blob/main/app/models/concerns/turbo/broadcastable.rb
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
  - Opensource implementation of Flowbite components
    - https://github.com/themesberg/flowbite-admin-dashboard
    - https://github.com/themesberg/flowbite-astro-admin-dashboard
    - https://flowbite-admin-dashboard.vercel.app/playground/sidebar/
    - https://flowbite.com/application-ui/demo/e-commerce/billing/
    - https://flowbite.com/docs/components/breadcrumb/
    -
- use `view_component-contrib` gems
- [ViewComponent in the Wild II: supercharging your components](https://evilmartians.com/chronicles/viewcomponent-in-the-wild-supercharging-your-components#base-classes)

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

- [GoodJob](https://github.com/bensheldon/good_job)

  - **Designed for Active Job.** Complete support for async, queues, delays, priorities, timeouts, and retries with near-zero configuration.

  - **Built for Rails.** Fully adopts Ruby on Rails threading and code execution guidelines with Concurrent::Ruby.

  - **Backed by Postgres.** Relies upon Postgres integrity, session-level Advisory Locks to provide run-once safety and stay within the limits of schema.rb, and LISTEN/NOTIFY to reduce queuing latency.

  > Kesimpulannya, GoodJob ni Sidekiq without Redis. Just use Postgres. No need to additionally setup Postgres.  Simpler.

- Sidekiq

  - https://blog.morizyun.com/ruby/library-sidekiq-job-queue-active-job.html

- [Building a Component Library with ViewComponent, Tailwind and Lookbook](https://content.ophelos.com/post/building-a-component-library-with-viewcomponent-tailwind-and-lookbook)

- SSE

  - [Fetch Event Source](https://github.com/Azure/fetch-event-source)  \
    provides a better API for making Event Source requests - also known as server-sent events - with all the features available in the Fetch API.

  - [Using Fetch Event Source for server-sent events in React](https://blog.logrocket.com/using-fetch-event-source-server-sent-events-react/)

  - [Server Sent Events in React](https://medium.com/@imanshurathore/server-sent-events-in-react-30021f9ffc4a)

  - [Example of Server-Sent Events in Client (React)](https://gist.github.com/marttp/5bdfa30acfc44b24ff3262893d61e4ca)

- WS Tutorial

  - [Building a Chat Application with React and Websockets](https://www.sohamkamani.com/reactjs/chat-application/)
