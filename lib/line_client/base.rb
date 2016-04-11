module LineClient
  class Base
    def self.create(attributes=nil, opt={}, &block)
      connection(__method__).post(attributes)
    end

    private
    def self.connection(action)
      LineClient::Connection.new(uri(action))
    end

    def self.uri(action)
      URI.parse Settings.api.uri + ApiUri.build(fetch_class, action)
    end

    def self.fetch_class
      self.name.split('::').last.downcase.to_sym
    end
  end
end
