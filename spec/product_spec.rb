require 'product.rb'

	describe Product do
	
		let(:soda) {Product.new("soda",10)}
		
		it 'has a price' do
			expect(soda.price).to eq(10)
		end

		it 'has a default price' do
			cake = Product.new ("cake")
			expect(cake.price).to eq(1)
		end

			it 'has a name' do
			cake = Product.new ("cake")
			expect(cake.name).to eq("cake")
		end

	end