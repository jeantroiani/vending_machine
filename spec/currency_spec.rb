require 'currency'

	describe Currency do
		
		context 'can' do
		
			let(:currency) {Currency.new}	
			
			it 'gives you the value of the grade' do
				expect(currency.grade(:pound)).to eq(1.0)
			end

			it 'converts amount and grade to units' do
				expect(currency.unit_conversion(2 , :five_pence)).to eq(0.1)
			end
		
		end
	
	end