class Article < ActiveRecord::Base
	extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list=(names)
		self.tags = names.split(",").map do |name|
				Tag.where(name: name.strip).first_or_create!
		end
	end

	def tag_list
		self.tags.map(&:name).join(", ")
	end
	
	def self.tagged_with(name)
		Tag.find_by_name!(name).articles
	end
	
  validates :title, presence: true,
                    length: { minimum: 5 }
end
