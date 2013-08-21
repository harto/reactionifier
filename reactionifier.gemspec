Gem::Specification.new do |s|
  s.name        = "reactionifier"
  s.version     = "0.0.1"
  s.authors     = ["Stuart Campbell"]
  s.email       = ["stuart@harto.org"]
  s.homepage    = "http://github.com/harto/reactionifier"
  s.summary     = "Scrapes GIF URLs from reactiongifs.com"
  s.description = s.summary

  s.add_dependency "nokogiri"

  s.add_development_dependency "mocha"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end
