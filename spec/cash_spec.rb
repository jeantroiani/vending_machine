require 'cash'

	describe Cash do

		context 'can' do
			let (:currency) {Currency.new}
			let (:cash) 		{Cash.new(currency)}

			it 'receive money' do
				cash.insert(1 , :pound)
				expect(cash.coin_container[:pound]).to eq(6)
			end

			it 'release money' do
				cash.release(1, :two_pounds)
				expect(cash.coin_container[:two_pounds]).to eq(4)
			end

			it 'changes all coins to units' do
				expect(cash.iteration(cash.coin_container)).to eq([10.0,5.0,2.5,1.0,0.5,0.25,0.1,0.05])
			end

			it 'tells the cash available' do
				expect(cash.money_available).to eq(19.4)
			end

			it 'sorts change' do
				cash.give_change(3.5)
				expect(cash.coin_container[:two_pounds]).to eq(4)
				expect(cash.coin_container[:pound]).to eq(4)
				expect(cash.coin_container[:fifty_pence]).to eq(4)
			end

		end

	end