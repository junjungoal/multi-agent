class WebhookController < ApplicationController
  def callback
    logger.debug("hello")
    render :nothing => true, status: :ok
  end
end
