require "q_translate/version"

module QTranslate  
  class Translation
    
    attr_accessor :text, :locale, :fallback

    def initialize text, options={}
      @text = text
      @locale = options[:locale] || I18n.locale
      @fallback = options[:fallback] || true
    end
    
    def translate
      return @text if @text and @text.blank?
      return translations[@locale] if translations.has_key?(@locale)
      return translations[I18n.default_locale] if @fallback and translations.has_key?(I18n.default_locale)
      return '' if translations.keys.any?
      @text
    end
    
    def translations
      @translations ||= split_locales
      @translations
    end
    
    protected

    def split_locales
      translations_per_locale = {}
      self.text.split('<!--:-->').each do |t|
        t.match(/^<!--:([\w]{2})/) do |lang|
          translations_per_locale[lang[1].to_sym] = t.gsub(/<!--:#{lang[1]}-->(.*)/, '\1')
        end
      end
      translations_per_locale
    end

  end  
end