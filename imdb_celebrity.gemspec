Gem::Specification.new do |s|
  s.name              = %q{imdb_celebrity}
  s.version           = "0.0.3"
  s.date              = %q{2010-10-20}
  s.authors           = ["Sandeep Kumar"]
  s.email             = %q{sandeep@sapnasolutions.com}
  s.summary           = %q{Imdb_celebrity is a ruby-gem which is used to scrape celebrity pages from imdb.com}
  s.homepage          = %q{http://github.com/sandeepkrao/imdb_celebrity}
  s.description       = %q{Imdb_celebrity is a ruby-gem which is used to scrape celebrity pages from imdb.com}
  s.files             = Dir["**/*"]
  s.test_files        = Dir["spec/**"]
  s.executables       = ["imdb_celebrity"]
  s.add_dependency    "nokogiri"
  s.add_dependency    "hpricot"
end