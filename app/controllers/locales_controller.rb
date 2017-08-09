class LocalesController < ApplicationController
  def update
    change_language(params[:lang])
    redirect_to(:back)
  end

  private

  def change_language(lang)
    cookies[:lang] = {
      value: lang,
      expires: 1.month.from_now
    }
  end
end
