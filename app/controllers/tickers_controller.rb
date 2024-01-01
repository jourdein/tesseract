class TickersController < ApplicationController
  before_action :set_ticker, only: %i[show destroy]

  def index
    # @tickers = ::Ticker.all
    # @show_tickers = params[:proceed] || !@tickers.empty?
  end

  private

  def set_ticker
    @ticker = ::Ticker.find(params[:id])
  end

  def valid_params
    params.required(:ticker).permit(:symbol)
  end
end
