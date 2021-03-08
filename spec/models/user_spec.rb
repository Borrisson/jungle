require "rails_helper"

RSpec.describe User, type: :model do
  describe "User" do
    subject { User.new(:first_name => "Luc", :last_name => "brucie", :email => "new@new.ca", :password => "password", :password_confirmation => "password") }
    before { subject.save! }

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
end
