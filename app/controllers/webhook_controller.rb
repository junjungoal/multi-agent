class WebhookController < ApplicationController
  def callback
    render :nothing => true, status: :ok
  end
end
