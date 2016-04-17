class YelpMessage
  def self.build(res)
    res.businesses.map do |content|
      "名前 : #{content.name} \n レート: #{content.rating} \n url: #{content.url}"
    end
  end
end

