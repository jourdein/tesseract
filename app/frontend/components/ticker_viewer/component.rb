# frozen_string_literal: true

class TickerViewer::Component < ApplicationViewComponent
  option :ticker

   # negative numbers have a - sign but positive ones don't
  def change_value(attribute)
    value = ticker.send(attribute)
    puts "@ CHANGE VALUE #{value} #{ticker.symbol}"
    if value.positive?
      "+#{value}"
    else
      value
    end
  end
end
