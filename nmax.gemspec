# frozen_string_literal: true

require_relative 'lib/nmax/version'

Gem::Specification.new do |spec|
  spec.name          = 'nmax'
  spec.version       = Nmax::VERSION
  spec.authors       = ['Mikhail Grigoriev']
  spec.email         = ['mgrigoriev@gmail.com']

  spec.summary       = 'Reads data from standard input and finds N max numbers'
  spec.homepage      = 'https://github.com/mgrigoriev'
  spec.licenses      = 'Nonstandard'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
