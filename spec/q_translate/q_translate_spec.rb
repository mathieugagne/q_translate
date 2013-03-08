require 'spec_helper'

TEST_STRING = "<!--:en-->And this is how the Universe ended.<!--:--><!--:fr-->Et c'est ainsi que l'univers connu cessa d'exister.<!--:-->"

describe QTranslate::Translation do    
  
  describe '#translate' do

    context 'when translated' do

      it "returns appropriate translation if locale is set" do
        I18n.locale = :fr
        @text = QTranslate::Translation.new(TEST_STRING)
        @text.translate.should match "Et c'est ainsi que l'univers connu cessa d'exister."
      end
      
      it "returns appropriate translation and overrides default if locale is passed as option" do
        I18n.locale = :fr
        @text = QTranslate::Translation.new(TEST_STRING, locale: :en)
        @text.translate.should match "And this is how the Universe ended."
      end

    end
    
    context 'when not translated' do

      context 'when fallback is true' do
        it "returns default locale" do
          I18n.locale = :es
          @text = QTranslate::Translation.new(TEST_STRING)
          @text.translate.should match 'And this is how the Universe ended.'
        end
      end
      context 'when fallback is false' do
        it 'returns an empty string' do
          I18n.locale = :es
          @text = QTranslate::Translation.new(TEST_STRING)
          @text.translate.should match ''
        end
      end
      
      it "returns itself if no sign of translation" do
        @text = QTranslate::Translation.new("Whatever man!")
        @text.translate.should match "Whatever man!"
      end

      it "returns an empty string if translations are present but none match" do
      end
      
    end
  end

  describe '#translations' do

    it "returns a hash of locales and associated translated text" do
      @text = QTranslate::Translation.new(TEST_STRING)
      @text.translations.should be_a Hash
      @text.translations.should have(2).keys
      @text.translations[:en].should match "And this is how the Universe ended."
      @text.translations[:fr].should match "Et c'est ainsi que l'univers connu cessa d'exister."
    end

  end
end