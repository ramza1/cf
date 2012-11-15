class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(params[:subscription])
    respond_to do |format|
      if @subscription.save
        format.js
      else
        format.js {render :file => "subscriptions/error.js.erb"}
      end
    end
  end
end
