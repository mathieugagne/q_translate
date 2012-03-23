require 'spec_helper'

TEST_STRING = "<!--:en-->And this is how the Universe ended.<!--:--><!--:fr-->Et c'est ainsi que l'univers connu cessa d'exister.<!--:-->"

describe QTranslate::Translation do    
      
  before :each do
    @text = QTranslate::Translation.new(TEST_STRING)
  end
  
  describe '.translate' do
        
    describe 'if translated' do
      
      it "should return French translation if locale is French" do
        I18n.locale = :fr
        @text.translate.should match "Et c'est ainsi que l'univers connu cessa d'exister."
      end
      
      it "should return English translation if locale is English" do
        I18n.locale = :en
        @text.translate.should match "And this is how the Universe ended."
      end
            
    end
    
    describe 'if not translated' do
      
      it "should use default locale" do
        I18n.locale = :es
        @text.translate.should match 'And this is how the Universe ended.'
      end
      
      it "should return itself" do
        @text = QTranslate::Translation.new("Whatever man!")
        @text.translate.should match "Whatever man!"
      end
      
    end
  end
    
  describe '.translations' do
      
    it "should return a hash of locales and associated translated text" do
      @text.translations.should be_a Hash
      @text.translations.should have(2).keys
      @text.translations[:en].should match "And this is how the Universe ended."
      @text.translations[:fr].should match "Et c'est ainsi que l'univers connu cessa d'exister."
    end
      
  end
end