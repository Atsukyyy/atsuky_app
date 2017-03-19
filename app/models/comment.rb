class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, presence: true
  validates :content, presence: true
  accepts_nested_attributes_for :post, allow_destroy: true
end
