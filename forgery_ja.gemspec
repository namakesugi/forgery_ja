# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "forgery_ja/version"

Gem::Specification.new do |s|
  s.name        = "forgery_ja"
  s.version     = ForgeryJa::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["namakesugi"]
  s.email       = ["info@namakesugi.net"]
  s.homepage    = ""
  s.summary     = %q{Forgery for Japanese Data}
  s.description = %q{Easy to }

  s.rubyforge_project = "forgery_ja"
  s.add_dependency "forgery", "~>0.2.2"
  s.add_development_dependency "rspec"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
