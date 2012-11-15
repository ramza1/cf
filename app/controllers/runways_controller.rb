class RunwaysController < ApplicationController
  load_and_authorize_resource
  before_filter :setup
  def show
    unless @runway_collections.empty?
      @first_group = @runway_collections.first.photos
    end
  end

  protected

  def setup
    @search =  Runway::Collection.accessible_by(current_ability).search(params[:q])
    @runway_collections = @search.result
    @year = Runway::Year.order("name desc")
  end
end
