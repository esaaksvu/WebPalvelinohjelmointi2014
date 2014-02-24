module ApplicationHelper
  def round_average(n)
    number_with_precision(n, precision: 1)
  end
end
