require_relative 'lib/pipidaster/version'

Gem::Specification.new do |spec|
  spec.name          = "pipidaster"
  spec.version       = Pipidaster::VERSION
  spec.authors       = ["Valentyn Ostakh"]
  spec.email         = ["valikos.ost@gmail.com"]

  spec.summary       = %q{Storing of trees in materialized path maner}
  spec.description   = %q{Storing of trees in materialized path maner}
  spec.homepage      = "https://github.com/valikos/pipidaster"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
