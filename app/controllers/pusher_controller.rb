class PusherController < ApplicationController
  protect_from_forgery :except => :authentication # stop rails CSRF protection for this action

  def authentication
    if current_user
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id])
      render :json => response
    else
      render :text => "No Channel Found", :status => '200'
    end
  end
end