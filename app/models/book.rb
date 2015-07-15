class Book < ActiveRecord::Base
	belongs_to :author
	validates :title, :description, presence: true
end
