module ApplicationHelper
  def format_date(date)
    date.strftime("%Y, %b %-d")
  end

  def format_number(number)
    number = number.round(2) if number.is_a? Float

    number_with_delimiter number, delimiter: " ", separator: "."
  end
end
