class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
     {  
      contentType: LineContent::TEXT,
      text: "#{content.name} \n\nAddress: #{build_address(content.location.display_address)} \n\nRate: #{content.rating}" 
     }
    end
  end

  def self.build_address(display_address)
    display_address.pop
    display_address.reverse.join
  end
end

