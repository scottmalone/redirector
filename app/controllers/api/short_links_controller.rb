module Api
  class ShortLinksController < ApplicationController
    def create
      outcome = ShortLinks::CreateShortLink.run(
        email: short_link_params[:email],
        original_url: short_link_params[:original_url]
      )

      if outcome.valid?
        render jsonapi: outcome.result, status: 201
      else
        render jsonapi_errors: outcome.errors.full_messages
      end
    end

    def show
      short_link = ShortLink.find_by(short_url_code: params[:id])

      if short_link
        render jsonapi: short_link
      else
        render jsonapi_errors: "Not Found", status: 404
      end
    end

    private

      def short_link_params
        params.require(:short_link).permit(:email, :original_url)
      end
  end
end
