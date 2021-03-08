require "rails_helper"

RSpec.describe User, type: :model do
  subject { User.new(:first_name => "Luc", :last_name => "brucie", :email => "new@new.ca", :password => "password", :password_confirmation => "password") }
  before { subject.save! }
  describe "User" do
    context "Validates" do
      it "will save with all fields present with identical passwords" do
        expect(subject).to be_valid
      end

      context "passwords" do
        it "will not save if password_confirmation and password are not the same" do
          subject.password = "different_password"
          expect(subject).to_not be_valid
          expect(subject.errors.empty?).to_not be true
          subject.password = "password"
          expect(subject).to be_valid
        end
        it "will not save if either passwords are nil" do
          subject.password = nil
          expect(subject).to_not be_valid
          subject.password = "password"
          subject.password_confirmation = nil
          expect(subject).to_not be_valid
        end
        it "must have a minimum length of 8 characters" do
          subject.password = "passwor"
          subject.password_confirmation = "passwor"
          expect(subject).to_not be_valid
        end
      end

      it "will not save if email already exists in data base (case_insesitive)" do
        expect(subject.save).to be true
        @same_user = User.new(:first_name => "Luc", :last_name => "brucie", :email => "new@NEW.ca", :password => "password", :password_confirmation => "password")
        expect(@same_user.save).to be false
      end
    end
  end

  describe ".authenticate_with_credentials" do
    it "allows users to login with there email and password" do
      expect(subject.save).to be true
      expect(User.authenticate_with_credentials("new@new.ca", "password")).to eq(User.find_by_id(6))
    end
    it "allows email case_insensitive logon" do
      expect(User.authenticate_with_credentials("new@NEW.ca", "password")).to eq(User.find_by_id(6))
    end

    it "allows users to logon with whitespaces around email" do
      expect(User.authenticate_with_credentials("   new@new.ca   ", "password")).to eq(User.find_by_id(6))
    end
  end
end
