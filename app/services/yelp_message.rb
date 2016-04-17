class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
     {  
      contentType: LineContent::TEXT,
      text: "#{content.name} \n\n レート: \n #{content.rating} \n\n 住所: #{content.location.address.first}" 
     }
    end
  end
end

