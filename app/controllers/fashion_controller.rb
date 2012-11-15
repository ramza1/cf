class FashionController < ApplicationController
  load_and_authorize_resource
  def show
    @fashion_juries = FashionJury.accessible_by(current_ability).recent.limit(3)
    @trend_spotting = TrendSpotting.accessible_by(current_ability).last
    @collections =  Runway::Collection.accessible_by(current_ability).recent.limit(4)
    @photos = @trend_spotting.photos.limit(4)
    @men_fashions = MenFashion.accessible_by(current_ability).recent.limit(2)
  end
end
