# -*- encoding: utf-8 -*-
require File.expand_path('../lib/q_translate/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "q_translate"
  gem.authors       = ["Mathieu Gagné"]
  gem.email         = ["mathieu@orangebrule.com"]
  gem.description   = %q{Extends String with a 'translate' method. Returned value is the according translated text for a Wordpress Post translated by QTranslate plugin.}
  gem.summary       = %q{Extends String with a 'translate' method. Returned value is the according translated text for a Wordpress Post translated by QTranslate plugin. Useful for Wordpress integration in a Rails app where the admin bloggin side is handled by Wordpress Engine. The default value if translation is not provided is English.}
  gem.homepage      = "http://github.com/orangebrule/q-translate"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = QTranslate::VERSION
  
  gem.add_development_dependency 'rspec'
  
end
