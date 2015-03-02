class Spec < ActiveRecord::Base

	validates :title, presence: true,
					  uniqueness: true	

	has_and_belongs_to_many :specs

	def self.search(query)
		where("title ilike ?", "%#{query}%") + where("content ilike ?", "%#{query}%")
	end

end
