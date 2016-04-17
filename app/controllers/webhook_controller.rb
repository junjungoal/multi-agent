class WebhookController < ApplicationController
  before_action :fetch_result
  
  def callback
    logger.info({from_line: @result})    
    res = Yelp.client.search(@messages[1]. yelp_parameter)
    logger.info(res)
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
     @messages = params[:text].split("\n")
  end

  def yelp_params
    { term: @messages[0],
      limit: 2
    } 
  end
end
