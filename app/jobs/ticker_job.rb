class TickerJob < ActiveJob::Base
  queue_as :default

  def perform(ticker)
    puts "---> [tickerjob] perform"
    ticker.fetch
  end
end
