module ApplicationHelper
  def date_to_human(date)
    date.strftime('%d/%m/%Y')
  end
end
