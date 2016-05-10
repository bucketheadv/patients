class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale

  def render_404
    render json: {status: 404}, status: 404
  end

  def i18n
    locales = ['zh-CN', 'en']
    if params[:locale].to_s.in?(locales)
      session[:locale] = params[:locale]
    end
    redirect_to :back
  end

  private
  def set_locale
    if session[:locale].present?
      I18n.locale = session[:locale]
    end
  end
end
