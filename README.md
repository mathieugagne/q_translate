# QTranslate

Extends String with a 'translate' method. Returned value is the according translated text for a Wordpress Post translated by QTranslate plugin.

## Installation

Add this line to your application's Gemfile:

    gem 'q_translate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install q_translate

## Usage

Extends String with a 'translate' method. Returned value is the according translated text for a Wordpress Post translated by QTranslate plugin. Useful for Wordpress integration in a Rails app where the admin bloggin side is handled by Wordpress Engine. The default value if translation is not provided is English.


### Uses locale

    $ WpPost.post_title
    $ => "<!--:en-->And this is how the Universe ended.<!--:--><!--:fr-->Et c'est ainsi que l'univers connu cessa d'exister.<!--:-->"
    $ I18n.locale = :en
    $ WpPost.post_title.translate
    $ => "And this is how the Universe ended."

### Uses default locale if it has not been translated yet.

    $ WpPost.post_title
    $ => "<!--:en-->And this is how the Universe ended.<!--:-->"
    $ I18n.locale = :fr
    $ WpPost.post_title.translate
    $ => "And this is how the Universe ended."

### Spits the same text out if no translation tags are applied

    $ WpPost.post_title
    $ => "And this is how the Universe ended."
    $ I18n.locale = :fr
    $ WpPost.post_title.translate
    $ => "And this is how the Universe ended."


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
