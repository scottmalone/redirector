module Api
  class ShortLinksController < ApplicationController
    def create
      outcome = ShortLinks::CreateShortLink.run(
        email: short_link_params[:email],
        original_url: short_link_params[:original_url]
      )

      if outcome.valid?
        render jsonapi: outcome.result
      else
        render jsonapi_errors: outcome.errors.full_messages
      end
    end

    private

      def short_link_params
        params.require(:short_link).permit(:email, :original_url)
      end
  end
end
