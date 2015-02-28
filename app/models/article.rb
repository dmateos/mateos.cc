class Article < ActiveRecord::Base
  def nice_date
    created_at.strftime("%A, %B %d %Y")
  end
end
