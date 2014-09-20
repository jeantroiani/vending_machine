class Container
	
	attr_accessor :items

	def initialize
		@items = []	
	end

	def load(item)
		items << item
	end

	def release(item)
		index = items.find_index(item)
		items.delete_at(index)
	end

end