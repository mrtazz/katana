# config.ru
require "rubygems"
require File.expand_path("../app.rb", __FILE__)
run Katana::App
