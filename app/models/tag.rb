class Tag < ApplicationRecord
	has_many :taggings
	has_many :posts, through: :taggings

	def self.counts
	  self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")
	end

	def tag_cloud(tags, classes)
  max = tags.sort_by(&:count).last
  tags.each do |tag|
    index = tag.count.to_f / max.count * (classes.size-1)
    yield(tag, classes[index.round])
  end
end

end
