class HomeController < ApplicationController

  def index
  	@serve = Serve.new
  	@serves = Serve.where(checkout_time: nil).order(checkin_time: :desc)

  	@lastCheckin = Serve.where(checkout_time: nil).last
  end

end
