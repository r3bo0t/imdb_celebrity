$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'open-uri'
require 'imdb_celebrity/celebrity'
require 'imdb_celebrity/search'
require 'imdb_celebrity/string_extensions'
require 'imdb_celebrity/parser/parser'

module ImdbCelebrity
  VERSION = '0.0.1'
end