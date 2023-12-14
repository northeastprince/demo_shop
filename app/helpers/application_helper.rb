module ApplicationHelper
  def monetarily_format(amount)
    "$#{number_with_precision(amount, precision: 2)}"
  end
end
