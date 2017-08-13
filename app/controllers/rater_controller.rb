class RaterController < ApplicationController
  def create
    if user_signed_in?
      add_star
      render json: true
    else
      render json: false
    end
  end

  private

  def add_star
    obj = params[:klass].classify.constantize.find(params[:id])
    obj.rate params[:score].to_f, current_user, params[:dimension]
  end
end
