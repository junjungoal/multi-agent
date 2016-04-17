class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
     {  
      contentType: LineContent::TEXT,
      text: "#{content.name} \n\nレート: #{content.rating} \n\n住所: #{build_address(content.location.display_address)}" 
     }
    end
  end

  def self.build_address(display_address)
    display_address.pop
    display_address.reverse.join
  end
end

