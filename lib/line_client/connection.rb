module LineClient
  class Connection
    def initialize(uri)
      @uri = uri
    end

    def post(attributes={})
      _req = Net::HTTP::Post.new("https://trialbot-api.line.me") 
      _req.set_content_type("application/json; charset=UTF-8")
      _req['Content-type'] = 'application/json; charset=UTF-8'
      _req['X-Line-ChannelID'] = ENV["LINE_CHANNEL_ID"]
      _req['X-Line-ChannelSecret'] = ENV["LINE_CHANNEL_SECRET"]
      _req['X-Line-Trusted-User-With-ACL'] = ENV["LINE_CHANNEL_MID"]
      _req.body = attributes
      start(_req, @uri)
    end

    private

    def start(req, uri)
      _proxy_class = Net::HTTP::Proxy(ENV["LINE_OUTBOUND_PROXY"], 80)
      _proxy_class.new(@uri).start { |http|
        http.request(req)
      }
    end
  end
end

