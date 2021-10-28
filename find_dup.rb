
$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'Compare'
compare = Compare.new
$LOAD_PATH.unshift File.expand_path(__dir__)

compare.CountFiles(__dir__)
compare.AllFiles

compare.FindDuplications

