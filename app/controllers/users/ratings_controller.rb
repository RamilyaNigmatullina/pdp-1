module Users
  class RatingsController < Users::BaseController
    expose(:article)
    expose(:rating) { article.ratings.find_or_initialize_by(user: current_user) }

    def new
    end

    def create
      rating.update(rating_params)
      article.update_column(:average_rating, article.ratings.avearge(:score))
      respond_with article
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
