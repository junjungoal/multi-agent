class YelpMessage
  def self.build(res)
    res.businesses.map.with_index do |content, i|
     {  
      contentType: LineContent::TEXT,
      text: "#{i + 1}. #{content.name} \n\nAddress: #{build_address(content.location.display_address)} \n\nRate: #{content.rating}" 
     }
    end
  end

  def self.build_address(display_address)
    display_address.pop
    display_address.reverse.join
  end

end

