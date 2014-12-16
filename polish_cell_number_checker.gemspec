# -*- encoding: utf-8 -*-
require File.expand_path('../lib/polish_cell_number_checker/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Damian Baćkowski"]
  gem.email         = ["damianbackowski@gmail.com"]
  gem.description   = %q{Provide polish cell number check}
  gem.summary       = %q{Provide check when phone number is polish cell number, get operator name}
  gem.homepage      = "https://github.com/dbackowski/polish_cell_number_checker"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "polish_cell_number_checker"
  gem.require_paths = ["lib", "yaml"]
  gem.version       = PolishCellNumberChecker::VERSION
  gem.license = 'MIT'

  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.1.0'
end
