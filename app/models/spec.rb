class Spec < ActiveRecord::Base

	validates :title, presence: true,
					  uniqueness: true	

	has_and_belongs_to_many :specs
	has_attached_file :image, styles: {large: "600x600", medium: "300x300", thumb: "100x100" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	def self.search(query)
		where("title ilike ?", "%#{query}%") + where("content ilike ?", "%#{query}%")
	end

end
