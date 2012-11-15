module FashionJuriesHelper
  def custom_pluralizer(count)
    if count == 1
      '<span class="comment_count">'  "#{count}" '</span>' " " "comment"
    else
      '<span class="comment_count">'  "#{count}" '</span>' " " "comments"
    end
  end
end
