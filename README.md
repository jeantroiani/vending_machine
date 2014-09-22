<a href="https://codeclimate.com/github/jeantroiani/vending_machine"><img src="https://codeclimate.com/github/jeantroiani/vending_machine/badges/gpa.svg" /></a>

<a href="https://codeclimate.com/github/jeantroiani/vending_machine"><img src="https://codeclimate.com/github/jeantroiani/vending_machine/badges/coverage.svg" /></a>


Vending Machine
===========

Programming Exercise
Design a vending machine in code. The vending machine, once a product is selected and the appropriate amount of money is inserted, should return that product. It should also return change if too much money is provided or ask for more money if there is not enough. The machine should take an initial load of products and change with denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2. There should also be a way of reloading both products and change at a later point. The machine needs to keep track of the products and money that it contains.
You may choose any language or techniques to develop the machine. You will be asked questions about the techniques that you use rather than the completeness of your solution. Please look at the job description 


Technologies used
------------------

- Ruby.
- RSpec.


How to setup and run it
-----------------------

    git@github.com:jeantroiani/vending_machine.git
    cd vending_machine
    bundle install
    pry (or IRB)
    require './lib/vending.rb'
    cake = Product.new(:cake,1.55)  (To create products with a name and price)
    currency = Currency.new (Creates a currency system, in this case UK version)
    cash = Cash.new(currency) (To add a cash container with the currency of your preference)
    products = Container.new (To create a box of items to sell)
    machine = Vending.new(cash: cash, products: products) (To deploy a vending machine)
    machine.products.load(cake)  (loads item into the machine)
    machine.buy(cake,2, :pound) (Buy a cake or anything other product and amount inserted)
        If you haven't inserted all the money required to buy an item, you will be asked to keep
        introducing money, please use the correct format (1,two_pounds)
    machine.products.items  (To see what items are available)
    machine.cash.insert(1,:pound)  (To load the machine with more money)
    
How to test it
----------------
    git@github.com:jeantroiani/vending_machine.git
    cd vending_machine
    rspec

