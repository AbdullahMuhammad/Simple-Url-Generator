class TrackedUrlsController < ApplicationController
  def index
    @tracked_urls = TrackedUrl.where(status: true).order(:name).page(params[:page]).per(5)
  end

  def visit
    @tracked_url = TrackedUrl.find(params[:id])
    visitor = Visitor.new(tracked_url_id: @tracked_url.id, ip_add: request.ip)
    if visitor.save
      flash[:info] = 'You visit got recorded successfully.'
    else
      flash[:error] = 'You visit could not be recorded.'
    end
    record_extra_info_from_ip(visitor)
    redirect_to root_url
  end


  def record_extra_info_from_ip(visitor)
    #For a bigger app this should be in a separate file but its ok for this scale.
    #TODO cater timeout here but i think this is out of scope for the demo project. Will cater it later.
    response = HTTParty.get("http://ip-api.com/json/#{request.ip}")
    if response && response.parsed_response
      visitor.country = response.parsed_response['country']
      visitor.city = response.parsed_response['city']
      visitor.timezone = response.parsed_response['timezone']
      visitor.zipcode = response.parsed_response['zipcode']
      visitor.save
    end
  end
end
