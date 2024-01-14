# web: env RUBY_DEBUG_OPEN=true bin/rails server -p 3000
web: env VANTAGE_API_KEY=SCAPPBIK1OVYCFAG bin/rails server -p 3000
css: bin/rails tailwindcss:watch
sidekiq: bundle exec sidekiq -C config/sidekiq.yml

# overmind s -f Procfile.dev -l sidekiq,css
# overmind s -l sidekiq,css
