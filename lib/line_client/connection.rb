module LineClient
  class Connection
    def initialize(uri)
      @uri = uri
    end

    def post(attributes={})
      _req = Net::HTTP::Post.new(@uri.path) 
      _req.set_content_type("application/json; charset=UTF-8")
      _req['X-Line-ChannelID'] = ENV["LINE_CHANNEL_ID"]
      _req['X-Line-ChannelSecret'] = ENV["LINE_CHANNEL_SECRET"]
      _req['X-Line-Trusted-User-With-ACL'] = ENV["LINE_CHANNEL_MID"]
      _req.body = attributes.to_json
      start(_req, @uri)
    end

    private

    def start(req, uri)
      _, username, password, host, port = ENV["FIXIE_URL"].gsub(/(:|\/|@)/,' ').squeeze(' ').split
      http =  Net::HTTP.new(uri.host, uri.port, host, port, username, password)
      http.use_ssl = true
      http.request(req)
    end
  end
end

