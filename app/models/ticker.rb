# frozen_string_literal: true

class Ticker < ApplicationRecord
  validates_uniqueness_of :symbol, message: 'you are already tracking this ticker'
  validates_presence_of :symbol

  before_save -> { symbol.upcase! }

  after_update_commit -> {
    puts "[AFTER_UPDATE] [BROADCAST_REPLACE_TO] #{self.id}-#{self.symbol}".colorize(color: :blue, mode: :bold)
    broadcast_replace_to(:tickers)
  }
  after_destroy_commit -> {
    puts "[AFTER_DESTROY] [BROADCAST_REMOVE_TO] #{self.id}-#{self.symbol}".colorize(color: :red, mode: :bold)
    broadcast_remove_to(:tickers)
  }
  after_create_commit -> {
    puts "[AFTER_CREATE] #{::Ticker.count} [BROADCAST_REPLACE_TO] #{self.id}-#{self.symbol}".colorize(color: :red, mode: :bold)
    fetch_it

    # it's more efficient and better visually to only add the new one to the list
    # but I'm using this as an example to show different ways
    broadcast_replace_to(:tickers, target: :tickers, partial: 'tickers/index', locals: { tickers: ::Ticker.all })
  }

  # fetch price from API and store it
  def fetch!
    stock = client.stock(symbol: symbol)

    puts "[FETCH STOCK #{symbol}] => #{stock}"

    if $real_data
      quote = stock.quote
      quote_h = quote.to_h.except(:output)
    else
      quote_h = stock.except(:name, :exchange, :market_cap, :country, :ipo_year, :sector, :industry, :total_stock)
      # replace net_change with change
      quote_h[:change] = quote_h.delete(:net_change)
      quote_h[:change_percent] = quote_h.delete(:percent_change)
    end

    quote_h.merge!({ last_fetch_at: Time.now.utc })

    # only update if there is a change
    update(quote_h) if stock[:price] != price
  end

  # Same as fetch! but skips if last update was less than a minute ago
  def fetch
    return self if last_fetch_at.present? && (Time.now.utc - last_fetch_at < 1.minute)

    fetch!
  end

  def self.generate_random
    puts '[RANDOM GENERATOR]'
    ::Ticker.create(symbol: 'AAPL')
    ::Ticker.create(symbol: 'TSLA')
    ::Ticker.create(symbol: 'UAL')
    ::Ticker.create(symbol: 'MSFT')
  end

  def ready?
    change.present?
  end

  private

  def client
    @client ||= if $real_data
      ::Alphavantage::Client.net(key: $vantage_api_key)
    else
      ::MarketInfo::Client.new
    end
  end

  def fetch_it
    puts "[PERFORM LATER #{self.id}]"
    TickerJob.set(wait: 1.seconds).perform_later self
    # TickerJob.perform_later self
  end
end
