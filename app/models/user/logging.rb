class User
  def create_log(attributes)
    Log.new(attributes) do |log|
      log.user  = self
      log.save!
      create_tag_and_location(attributes)
    end
  end
  
  def create_tag_and_location(attributes)
    input_tags = attributes["tags"].split(",").map(&:strip)
    input_location = attributes["location"]
    (input_tags - self.tags.map(&:name)).each do |tag|
      self.tags.create(:name => tag)
    end
    
    return if self.locations.map(&:name).include? input_location
    
    self.locations.create!(:name => input_location)
  end
end
