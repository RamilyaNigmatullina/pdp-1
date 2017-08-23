module Users
  class RatingsController < Users::BaseController
    expose(:article)
    expose(:rating)

    def new
    end

    def create
      rating.user = current_user
      rating.article = article
      rating.save
    end

    def edit
    end

    def update
    end

    private

    def rating_params
      params.require(:rating).permit(:score)
    end
  end
end
