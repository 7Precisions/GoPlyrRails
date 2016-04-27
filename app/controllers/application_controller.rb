class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :set_csrf_cookie_for_ng
  before_filter :authenticate_user
  include ApplicationHelper
  
  def home
  	render 'layouts/application'
  end

	def set_csrf_cookie_for_ng
	  cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
	end
	
  def profile
    if user_signed_in?
      render json: User.first
    else
      render json: {error: 'User has not logged in!'}
    end
  end

	protected

  # In Rails 4.2 and above
  def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  def authenticate_user
    if request.path.split("/").include?('admin')
      redirect_to root_path unless user_signed_in?
    end
  end
end
