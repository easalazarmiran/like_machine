# commit

class AddCounterCacheToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :likes_count, :integer, default: 0
  end
end
