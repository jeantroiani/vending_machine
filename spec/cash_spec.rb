require 'cash'

	describe Cash do

		context 'can' do

			let (:cash) {Cash.new}

			it 'receive money' do
				cash.insert(1 , :pound)
				expect(cash.coin_container[:pound]).to eq(1)
			end

			it 'release money' do
				cash.insert(2 , :two_pounds)
				cash.release(1, :two_pounds)
				expect(cash.coin_container[:two_pounds]).to eq(1)
			end

			it 'tells the cash available' do
				cash.insert(2 , :two_pounds)
				cash.insert(1, :fifty_pence)
				expect(cash.money_available).to eq(2.50)
			end

		end


	end