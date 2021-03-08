require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    subject { Product.new(:name => "Luc", :price => 10000, :quantity => 3, :category => Category.new(:name => "Electronics")) }
    before { subject.save! }
    context "Must Be Present" do
      it "will save with all fields present" do
        expect(subject).to be_valid
      end
      it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
        expect(subject.errors.messages[:name]).to eq ["can't be blank"]
      end
      it "is not valid without a price" do
        subject.price_cents = nil
        expect(subject).to_not be_valid
        expect(subject.errors.messages[:price_cents]).to eq ["is not a number"]
      end
      it "is not valid without a quantity" do
        subject.quantity = nil
        expect(subject).to_not be_valid
        expect(subject.errors.messages[:quantity]).to eq ["can't be blank"]
      end
      it "is not valid without a category" do
        subject.category = nil
        expect(subject).to_not be_valid
        expect(subject.errors.messages[:category]).to eq ["can't be blank"]
      end
    end
  end
end
