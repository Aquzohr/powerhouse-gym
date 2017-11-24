class HomeController < ApplicationController

  def index
  	@serve = Serve.new
  	@serves = Serve.where(checkout_time: nil)

  	@lastCheckin = Serve.where(checkout_time: nil).last
  end

end
