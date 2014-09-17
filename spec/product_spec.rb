require 'product.rb'

	describe Product do
	
		let(:coke) {Product.new(price: 10)}
		
		it 'has a price' do
			expect(coke.price).to eq(10)
		end

		it 'has a default price' do
			pepsi = Product.new
			expect(pepsi.price).to eq(1)
		end

		
	end