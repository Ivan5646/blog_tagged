class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  
  # for tagging
  acts_as_taggable
  
  # for friendly user url
  #def to_param
	#"#{id}-#{title.parameterize}"
  #end
end
