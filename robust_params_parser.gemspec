Gem::Specification.new do |gem|
  gem.name = 'robust_params_parser'
  gem.version = '0.0.1'
  gem.description = 'Params parser Rack middleware able to handle parsing errors'
  gem.summary = gem.description
  gem.homepage = 'https://github.com/kostia/robust_params_parser'
  gem.authors = ['Kostiantyn Kahanskyi']
  gem.email = %w[kostiantyn.kahanskyi@googlemail.com]
  gem.files = Dir['{app,lib,vendor}/**/*'] + %w[Rakefile README.md]
  gem.add_dependency 'rails', '~> 3.2.8'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rake'
end
