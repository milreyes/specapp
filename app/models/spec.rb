class Spec < ActiveRecord::Base

	validates :title, presence: true,
					  uniqueness: true	

	has_and_belongs_to_many :specs

	def self.search(query)
		where("title like ?", "%#{query}%") + where("content like ?", "%#{query}%")
	end

end
