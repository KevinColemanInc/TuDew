class Category < ActiveRecord::Base
	has_many :to_do
	
	validates :name, :presence => true
	
	def title
		if name != nil
			"#{name} (#{to_do.where('text != (?)',"").count})"
		else
			""
		end
	end
	def sorted_to_do
		to_do.all(:order => 'completed, rank, cost, created_at')
	end
	
end
