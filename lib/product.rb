class Product

	attr_accessor :price

	def initialize(price={})
		@price = price.fetch(:price, 1.00) 
	end

end
