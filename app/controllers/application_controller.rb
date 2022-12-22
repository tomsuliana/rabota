class ApplicationController < ActionController::Base
  before_action :set_locale
  around_action :switch_locale

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ?
      parsed_locale.to_sym :
      nil
  end

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url 
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)

    nil
  end
end
