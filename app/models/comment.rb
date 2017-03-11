class Comment < ActiveRecord::Base
  belongs_to :post
  #validates :post_id
  accepts_nested_attributes_for :post, allow_destroy: true
end
