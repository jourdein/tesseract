# frozen_string_literal: true
class TickersController < ApplicationController
  before_action :set_ticker, only: %i[show destroy]

  def index
    @tickers = ::Ticker.all
    @show_tickers = params[:proceed] || !@tickers.empty?

    if @tickers.empty?
      ::Ticker.generate_random
      @tickers = ::Ticker.all
    end
  end

  def destroy
    @ticker.destroy

    render turbo_stream: turbo_stream.replace('tickers', partial: 'index', locals: { tickers: ::Ticker.all })
  end

  private

  def set_ticker
    @ticker = ::Ticker.find(params[:id])
  end

  def valid_params
    params.required(:ticker).permit(:symbol)
  end
end
