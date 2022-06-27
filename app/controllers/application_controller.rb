class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale, :set_category

  private

  def set_category
    @categories = Category.all
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
