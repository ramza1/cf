class StyleController < ApplicationController
  load_and_authorize_resource
  def show
    @functional_fashion = FunctionalFashion.accessible_by(current_ability).recent.includes(:functional_fashion_designer)
    @look_books = LookBook.accessible_by(current_ability).recent.limit(2)
  end
end
