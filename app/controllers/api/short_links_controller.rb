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
        render_create_error(message: outcome.errors.full_messages[0], status: 420)
      end
    end

    def show
      short_link = ShortLink.find_by(short_url_code: params[:id])

      if short_link
        render jsonapi: short_link
      else
        render_create_error(message: "Not Found", status: 404)
      end
    end

    private

      def short_link_params
        params.permit(:email, :original_url)
      end
  end
end
