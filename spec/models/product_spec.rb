require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    context "Must Be Present" do
      it "saves with all fields present" do
        @mock_category = Category.new(:name => "Electronics")
        @product = Product.new(:name => "Luc", :price => 10000, :quantity => 3, :category => @mock_category)

        expect(@product.save!).to be true
      end
      it "name" do
        @mock_category = Category.new(:name => "Electronics")
        @product = Product.new(:name => nil, :price => 10000, :quantity => 3, :category => @mock_category)

        expect(@product.save).to be false
      end
      it "price" do
        @mock_category = Category.new(:name => "Electronics")
        @product = Product.new(:name => "Luc", :price => nil, :quantity => 3, :category => @mock_category)

        expect(@product.save).to be false
      end
      it "quantity" do
        @mock_category = Category.new(:name => "Electronics")
        @product = Product.new(:name => "Luc", :price => 10000, :quantity => nil, :category => @mock_category)

        expect(@product.save).to be false
      end
      it "category" do
        @product = Product.new(:name => "Luc", :price => 10000, :quantity => 3, :category => nil)

        expect(@product.save).to be false
      end
    end
  end
end
