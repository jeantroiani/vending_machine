class Product

	attr_accessor :price
	attr_reader   :name

	def initialize(name, price = 1)
		@price = price 
		@name  = name
	end

end
