module ApplicationHelper
  def soldout?(product)
    product <= 0
  end
end
