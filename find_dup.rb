#! /usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'application'

dir_path = File.expand_path('data', __dir__)
Application.start(dir_path)
