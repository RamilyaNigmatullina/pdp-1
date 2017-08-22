module Users
  class RatingsController < Users::BaseController
    # before_action :authorize_user!
    # before_action :authorize_user!, only: %i(edit update)

    # expose(:article)

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    private

    def authorize_user!
      # authorize(article, :manage?)
    end

    def rating_params
      params.require(:rating).permit(:value)
    end
  end
end
