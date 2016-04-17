class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
     {  
      contentType: LineContent::TEXT,
      text: "#{content.name} \n\n レート: #{content.rating} \n\n 住所: #{build_address(content.location.display_address)}" 
     }
    end
  end

  def self.build_address(display_address)
    display_address.reverse.join
  end
end

