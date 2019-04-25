class NotifyServicesWorker
  include Sidekiq::Worker

  def perform(short_link_id)
    # Placeholder for any interaction with 3rd party services that we don't want tripping up the main VisitShortLinkWorker
  end
end
