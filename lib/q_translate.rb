require "q_translate/version"

module QTranslate
  
  class Translation
    
    attr_accessor :original

    def initialize text
      @original = text
    end
    
    def locale
      I18n.locale
    end
    
    def translate      
      return @original if @original.blank?
      if translations.has_key? locale
        translations[locale]
      elsif translations.has_key? I18n.default_locale
        translations[I18n.default_locale]
      else
        @original
      end
    end
    
    def translations
      @translations = {}
      @original.split('<!--:-->').each do |t|
        t.match(/^<!--:([\w]{2})/) do |lang|
          @translations[lang[1].to_sym] = t.gsub(/<!--:#{lang[1]}-->(.*)/, '\1')
        end
      end
      @translations
    end
    
  end
  
end