Rails.application.routes.draw do
  post '/linebot/callback' => 'webhook#callback'
end

