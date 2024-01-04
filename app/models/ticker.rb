# frozen_string_literal: true

class Ticker < ApplicationRecord
  validates_uniqueness_of :symbol, message: 'you are already tracking this ticker'
  validates_presence_of :symbol

  before_save -> { symbol.upcase! }

  after_create_commit :fetch_it

  def fetch!
    puts '---> fetch!'

    stock = client.stock(symbol: symbol)

    puts "=> #{stock}"

    quote_h = stock.except(:name, :exchange, :market_cap, :country, :ipo_year, :sector, :industry, :total_stock)
    # replace net_change with change
    quote_h[:change] = quote_h.delete(:net_change)
    quote_h[:change_percent] = quote_h.delete(:percent_change)

    quote_h.merge!({ last_fetch_at: Time.now.utc })

    # only update if there is a change
    update(quote_h) if stock[:price] != price
  end

  # Same as fetch! but skips if last update was less than a minute ago
  def fetch
    puts '--> fetch'
    return self if last_fetch_at.present? && (Time.now.utc - last_fetch_at < 1.minute)

    fetch!
  end

  def self.generate_random
    puts 'generate random'
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
    @client ||= ::MarketInfo::Client.new
  end

  def fetch_it
    puts '--> fetch it!'
    TickerJob.set(wait: 30.seconds).perform_later self
    # TickerJob.perform_later self
  end
end