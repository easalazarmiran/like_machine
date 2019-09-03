# == Schema Information
#
# Table name: links
#
#  id         :bigint(8)        not null, primary key
#  url        :string
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# commit

class Link < ApplicationRecord
  belongs_to :user
  has_many :likes

  scope :top, -> { order('likes_count DESC') }

  validates_presence_of :url, :title
  validates :url, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

end
