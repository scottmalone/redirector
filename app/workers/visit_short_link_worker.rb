class VisitShortLinkWorker
  include Sidekiq::Worker

  def perform(short_link_id)
    short_link = ShortLink.find(short_link_id)
    ShortLinkVisit.create(short_link: short_link)
    #NotifyServicesWorker.perform_async(short_link_id)
  end
end
