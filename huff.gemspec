# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'huff/version'

Gem::Specification.new do |spec|
  spec.name          = "huff"
  spec.version       = Huff::VERSION
  spec.authors       = ["Ronie Uliana"]
  spec.email         = ["ronie.uliana@vagas.com.br"]
  spec.summary       = %q{A string based UUID generator}
  spec.description   = %q{You need a UUID from some string. Maybe a URL shortner without a database, or some kind of ID passed as parameter. This gem uses Huffman Coding [http://en.wikipedia.org/wiki/Huffman_coding] and base 36 integers [http://en.wikipedia.org/wiki/Base_36] to create such ID.}
  spec.homepage      = "https://github.com/ruliana/huff"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.0"
end
