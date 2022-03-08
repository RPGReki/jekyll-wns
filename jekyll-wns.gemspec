# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "jekyll-wns"
  spec.version       = "4.2.5"
  spec.authors       = ["Thai Chung"]
  spec.email         = ["mail@0xReki.de"]
  spec.summary       = "Collection of Filters, Tags and Hooks I use."
  spec.homepage      = "https://github.com/0xReki/jekyll-wns"
  spec.licenses      = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")

  spec.add_dependency("ruby-mp3info", "~> 0.8.10")
end
