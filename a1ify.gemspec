# frozen_string_literal: true

require_relative "lib/a1ify/version"

Gem::Specification.new do |spec|
  spec.name = "a1ify"
  spec.version = A1ify::VERSION
  spec.authors = ["Hokuto Shimura"]
  spec.email = ["hoqqun@gmail.com"]
  spec.summary       = "A Ruby gem for converting Excel R1C1 references to A1 format."
  spec.description   = <<~DESC
    A1ify is a Ruby gem that converts Excel's R1C1 cell references into the standard A1 format.
    It supports single or multiple references, handles boundary cases up to Excel's maximum
    supported row and column, and returns sorted references for convenience. Whether you need
    to generate or display cell references, A1ify provides a simple, efficient, and reliable solution.
  DESC
  spec.homepage = "https://github.com/hoqqun/a1ify"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hoqqun/a1ify"
  spec.metadata["changelog_uri"] = "https://github.com/hoqqun/a1ify"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
