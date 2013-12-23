class ApplicationController < ActionController::Base
  class NotPrivileged < StandardError; end

  respond_to :json

  before_filter :authenticate, unless: :create_user?

  rescue_from ActiveRecord::RecordInvalid do |exception|
    @object = exception.record
    render status: 400, template: 'errors/record_invalid'
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @object = exception.to_s
    render status: 404, template: 'errors/record_not_found'
  end

  rescue_from NotPrivileged do
    render status: 403, template: 'errors/not_privileged'
  end

  def create_user?
    request.fullpath == '/users' and request.method == 'POST'
  end

  def authenticate
    if user = authenticate_with_http_basic { |u, p| User.authenticate(u, p) }
      @current_user = user
    else
      render status: 401, template: 'errors/access_denied'
    end
  end

end
