class WebhookController < ApplicationController
  before_action :fetch_result
  
  def callback
    logger.info({from_line: @result})
    res = LineClient::Event(event_params)
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
        contentType: ContentType::TEXT,
        toType: ToType::USER,
        text: "JunJunGoal"
      },
      toChannel: TO_CHANNEL,
      eventType: EVENT_TYPE
    }
  end

  def fetch_result
     @result = params[:result].first
  end
end
