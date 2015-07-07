class Product < ActiveRecord::Base
	extend Enumerize

	belongs_to :category

	validates :title, :description, presence: true
	validates :price, :numericality => { :greater_than => 0}, presence: true
	validate :must_have_category

	before_validation :strip_html_from_description, :set_title_to_lowcase

	scope :published, -> {where(published: true)}
	scope :priced_more_than, ->(price) {where('price > ?', price)}

	def strip_html_from_description
	  self.description = ActionView::Base.full_sanitizer.sanitize(self.description)	
	end

	def set_title_to_lowcase
	  self.title = self.title.downcase	
	end

	def must_have_category
      if category.blank?
        self.errors.add(:category, "not existence") 
      end
    end

    enumerize :difficulty_level, in: [:hard, :medium, :easy]
    enumerize :country_origin, in: Country.all.map{|country_value, country_code|  country_code}

end