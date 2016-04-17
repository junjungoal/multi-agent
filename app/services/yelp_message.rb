class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
      "名前 : #{content.name} \n レート: #{cotent.rating} \n url: #{conent.url}"
    end
  end
end

