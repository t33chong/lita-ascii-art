Gem::Specification.new do |spec|
  spec.name          = "lita-ascii-art"
  spec.version       = "0.1.0"
  spec.authors       = ["Tristan Chong"]
  spec.email         = ["tristanchong@gmail.com"]
  spec.description   = %q{A Lita handler that generates ASCII art.}
  spec.summary       = %q{A Lita handler that generates ASCII art.}
  spec.homepage      = "https://github.com/tristaneuan/lita-ascii-art"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.0.0"
  spec.add_runtime_dependency "artii", ">= 2.0.4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta2"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
