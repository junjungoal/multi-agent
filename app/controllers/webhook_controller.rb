class WebhookController < ApplicationController
  before_action :fetch_result
  
  def callback
    logger.info({from_line: @result})
    LineClient::Message.create(event_params)
    render :nothing => true
  end

  private

  def event_params
    {
      to: [ @result["content"]["from"] ],
      content: {
        contentType: LineContent::TEXT,
        toType: LineToType::USER,
        text: "JunJunGoal"
      },
      toChannel: Settings.line.event.to_channel,
      eventType: Settings.line.event.type
    }
  end

  def fetch_result
     @result = params[:result].first
  end
end
