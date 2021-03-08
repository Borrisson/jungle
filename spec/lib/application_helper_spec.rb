require "spec_helper"
require "rails_helper"

class DummyClass
end

describe ApplicationHelper do
  dc = DummyClass.new
  dc.extend(ApplicationHelper)

  describe "soldout?" do
    it "returns true if less or equal to 0" do
      soldout = dc.soldout?(0)
      expect(soldout).to be true
    end
    it "returns false if greater than 0" do
      soldout = dc.soldout?(1)
      expect(soldout).to be false
    end
  end
end
