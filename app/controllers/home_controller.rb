class HomeController < ApplicationController
  def index
    @blogs = Blog.published.recent.limit(3)
    @fashion_juries = FashionJury.published.recent.limit(3)
    @men_fashion = MenFashion.published.recent.last
    @functional_fashions = FunctionalFashion.published.recent.limit(2)
    @collections =  Runway::Collection.published.recent.limit(4)
    @trend_spotting = TrendSpotting.published.recent.includes(:photos).last
    @photos = @trend_spotting.photos.limit(4)
    @videos = Video.published.recent.limit(7)
    @redcarpet = Redcarpet.published.recent.includes(:photos).last
    @redcarpet_photos = @redcarpet.photos.limit(10)
    if @redcarpet_photos.size >= 10
      @rp = @redcarpet_photos.limit(10)
    else
      @rp = @redcarpet_photos.limit(8)
    end
  end



  def search
    @q = params[:q]
    @blogs = Blog.published.where("title LIKE ?", "%#{@q}%")
    @fashion_juries = FashionJury.published.where("content LIKE ?", "%#{@q}%")
    @trend_spottings = TrendSpotting.published.where("title LIKE ?", "%#{@q}%" )
  end
end
