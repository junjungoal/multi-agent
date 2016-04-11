module LineClient
  class Connection
    def initialize(uri)
      @uri = uri
    end

    def post(attributes={})
      _req = Net::HTTP::Post.new("https://trialbot-api.line.me") 
      _req.set_content_type("application/json; charset=UTF-8")
      _req.headers = {
        'Content-type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => ENV["LINE_CHANNEL_ID"],
        'X-Line-ChannelSecret' => ENV["LINE_CHANNEL_SECRET"],
        'X-Line-Trusted-User-With-ACL' => ENV["LINE_CHANNEL_MID"]
      }
      _req.body = attributes
      start(_req, @uri)
    end

    private

    def start(req, uri)
      _proxy_class = Net::HTTP::Proxy(ENV['LINE_OUTBOUND_PROXY'])
      _proxy_class.start(@uri) {|http|
        http.request(req)
      }
    end
  end
end

