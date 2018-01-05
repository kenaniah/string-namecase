
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "string/namecase/version"

Gem::Specification.new do |s|
  s.name          = "string-namecase"
  s.version       = String::Namecase::VERSION
  s.authors       = ["Kenaniah Cerny"]
  s.email         = ["kenaniah@gmail.com"]

  s.summary       = "Provides proper name capitalization via String#namecase"
  s.homepage      = "https://github.com/kenaniah/string-namecase"

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activesupport", ">= 3"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
end
