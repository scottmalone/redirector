class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    report = Report.friendly.find(params[:id]) rescue nil
    
    if report.present?
      render params[:id].underscore.to_sym
    else
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end
end
