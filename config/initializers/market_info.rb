# frozen_string_literal: true

$vantage_api_key = ENV.fetch('VANTAGE_API_KEY') do
  Rails.application.credentials.alpha_vantage
end

$real_data = if $vantage_api_key.present?
  puts "VANTAGE_API_KEY is present!"
  true
else
  require Rails.root.join('lib', 'market_info', 'client.rb')
end
