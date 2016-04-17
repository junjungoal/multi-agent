class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
     {  
      contentType: LineContent::TEXT,
      text: "#{content.name} \n\n レート: \n #{content.rating} \n\n 営業時間: #{output_times(content)}" 
     }
    end
  end

  def self.output_times(content)
    if content.deals.time_start && content.deals.time_end
      "#{content.deals.time_start} ~ #{content.deals.time_end}"
    else 
      "なし"
    end
  end
end

