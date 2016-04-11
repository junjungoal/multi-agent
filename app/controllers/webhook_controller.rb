class WebhookController < ApplicationController
  before_action :fetch_result
  
  def callback
    logger.info({from_line: @result})
    res = LineClient::Message.create(event_params)
    if res.status == 200
      logger.info({success: res})
    else
      logger.info({fail: res})
    end
    render :nothing => true, status: :ok
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
      toChannel: ENV["TO_CHANNEL"],
      eventType: ENV["EVENT_TYPE"]
    }
  end

  def fetch_result
     @result = params[:result].first
  end
end
