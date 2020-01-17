require_relative 'lib/alotacookies/version'

Gem::Specification.new do |spec|
  spec.name          = "alotacookies"
  spec.version       = Alotacookies::VERSION
  spec.authors       = ["Dimitri Gedda"]
  spec.email         = ["gratitudeadore@fastmail.com"]

  spec.summary       = %q{Get some Cookie Info from Wiki Cookie site.}
  spec.description   = %q{Get some Cookie Info from Wiki Cookie site.}
  spec.homepage      = "http://www.nohomepageyetaaa.com"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  require 'rake'
  spec.files         = FileList['lib/*.rb', 'bin/*','[A-Z]*', 'test/*'].to_a
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "nokogiri"
end
