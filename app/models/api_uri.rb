class ApiUri
  def build(klass, action)
    case klass
    when :message
      message_path(action)
    end
  end

  private
  def message_path(action)
    case action
    when :create
      '/v1/events'
    end
  end
end

