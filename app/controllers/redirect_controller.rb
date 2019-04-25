class RedirectController < ApplicationController
  def show
    outcome = ShortLinks::VisitShortLink.run(short_url_code: params[:short_url_code])
    redirect_to prepend_http(outcome.result)
  end

  private

    def prepend_http(url)
      if url =~ %r(\Ahttp://) || url =~ %r(\Ahttps://)
        url
      else
        "http://#{url}"
      end
    end
end
