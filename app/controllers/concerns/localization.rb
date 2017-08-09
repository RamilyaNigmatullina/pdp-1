module Localization
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  def set_locale
    I18n.locale = extract_locale_from_cookie || I18n.default_locale
  end

  protected

  def extract_locale_from_cookie
    locale = cookies[:lang]
    I18n.available_locales.map(&:to_s).include?(locale) ? locale : nil
  end
end
