## RUNNING THE APP

```./bin/dev```


## HOTWIRE RAILS SETUP

### INSTALL RAILS

`rails new chat —skip-javascript`

`gem ‘hotwire-rails’`

`gem ‘importmap-rails’`

`bundle`

`rails importmap:install`

`rails hotwire:install`

### INSTALL TAILWINDS

`gem ‘tailwindcss-rails’`

`rails tailwindcss:install`

### INSTALL VIEWCOMPONENTS

`gem ‘view_component’`

`‘./app/components/**/*’` [config/tailwind.config.js]

## READINGS

### REALTIME
- [Mercure Hub](https://mercure.rocks/docs/ecosystem/awesome#examples)

- [Turbo Train](https://github.com/Uscreen-video/turbo-train)

- [Fastly-Fanout-Pushpin](https://www.fastly.com/blog/fastly-fanout-why-real-time-messaging-and-edge-computing-are-an-amazing-combination)\
“Fanout provides an Open Source implementation named Pushpin”
