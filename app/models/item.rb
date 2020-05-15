class Item < ApplicationRecord
	mount_uploader :img, ImgUploader
	belongs_to :user
	has_many :item_comments, dependent: :destroy
	validates :name, presence: true
	validates :contents, presence: true, length: {maximum: 200}
end
