# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  link_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# commit

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :link, counter_cache: true
end
