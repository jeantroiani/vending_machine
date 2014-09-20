require 'container'

	describe Container do
	
		context 'has' do

			let	(:container) {Container.new}
		
			it 'a container where to store products' do
				expect(container.items).to eq([])
			end
			
		end

		context 'can' do		
			
			let	(:container) {Container.new}
			let	(:cake) 		 {double "cake", price: 59}

			it 'can load a product' do
				# cake = double :cake, price: 59
				container.load(cake)
				expect(container.items).to eq([cake])	
			end

			it 'can release an item' do
				# cake = double :cake, price: 59
				container.load(cake)
				container.release(cake)
				expect(container.items).to eq([])
			end

		end

	end