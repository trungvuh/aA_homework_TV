require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :titleize => "Trung") }
  # let(:dessert) { double("dessert", :type => "creme_brulee")}
  subject(:panna_cotta) { Dessert.new("panna_cotta", 60, chef) }


  describe "#initialize" do
    it "sets a type" do
      expect(panna_cotta.type).to eq('panna_cotta')
    end

    it "sets a quantity" do
      expect(panna_cotta.quantity).to eq(60)
    end

    it "starts ingredients as an empty array" do
      expect(panna_cotta.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cupcake", "many", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(panna_cotta.ingredients).to_not include('black sesame')
      panna_cotta.add_ingredient("black sesame")
      expect(panna_cotta.ingredients).to include('black sesame')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients_list = %w(black_sesame soy_milk sugar water)
      ingredients_list.each {|ingre| panna_cotta.add_ingredient(ingre)}
      expect(panna_cotta.ingredients).to eq(ingredients_list)
      panna_cotta.mix!
      expect(panna_cotta.ingredients).to_not eq(ingredients_list)
      expect(panna_cotta.ingredients.sort).to eq(ingredients_list.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      panna_cotta.eat(20)
      expect(panna_cotta.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {panna_cotta.eat(80)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Trung the Great Baker")
      expect(panna_cotta.serve).to eq("Chef Trung the Great Baker has made 60 panna_cotta!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(panna_cotta)
      panna_cotta.make_more
    end
  end
end
