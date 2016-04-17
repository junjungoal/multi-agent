class WebhookController < ApplicationController
  before_action :fetch_result
  
  def callback
    logger.info({from_line: @result})
    res = LineClient::Message.create(event_params)
    logger.info({status: res.status})
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
      toChannel: Settings.line.to_channel,
      eventType: Settings.line.event_type
    }
  end

  def fetch_result
     @result = params[:result].first
  end
end
