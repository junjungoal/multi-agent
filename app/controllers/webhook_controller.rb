class WebhookController < ApplicationController
  before_action :fetch_result
  
  def callback
    logger.info({from_line: @result})
    res = LineClient::Message.create(event_params)
    logger.info({body: res.body})
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
      toChannel: 1383378250,
      eventType: "138311608800106203"
    }
  end

  def fetch_result
     @result = params[:result].first
  end
end
