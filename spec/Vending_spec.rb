require 'vending'

describe Vending do
		
	context 'has' do
		
		let(:machine) {Vending.new}
			
		it 'a product container when created' do
			expect(machine.products).to eq([])
		end 

	end

	context 'can' do

		let(:machine) {Vending.new}

		it 'can load a product' do
			cake = double :cake, price: 59
			machine.load(cake)
			expect(machine.products).to eq([cake])	
		end

		it 'release a product' do
			cake = double :cake, price: 59
			machine.load(cake)
			machine.release(cake)
			expect(machine.products).to eq([])	
		end

		it 'can load 3 pound' do
			machine.insert(3,:pound)
			expect(machine.cash[:pound]).to eq(3)
		end

		it 'can give back 2 pound' do
			machine.insert(3,:pound)
			machine.give_back(2,:pound)
			expect(machine.cash[:pound]).to eq(1)
		end

		xit 'can sell an item of 99p and give change for a pound' do
			cake = double :cake, price: 0.99
			machine.insert(2, :pound)
			machine.insert(2, :pence)
			machine.load(cake)
			machine.buy(cake, 1,:pound)
			expect(machine.cash[:pound]).to eq(3)
			expect(machine.cash[:pence]).to eq(1)
			expect(machine.products).to eq(0)
		end

		it 'calculates difference between price and amount inserted' do
			cost 	 = 0.99
			amount = 1
			expect(machine.difference(cost,amount)).to eq(0.01)
		end

		it 'gives back change using the right denomination' do
			machine.insert(1, :pound)
			machine.insert(1, :pence)
			machine.change(0.99).to eq(1,:pence)
		end

	end

end


