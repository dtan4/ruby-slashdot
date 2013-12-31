require "coveralls"
Coveralls.wear!

require "webmock/rspec"
WebMock.disable_net_connect!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'slashdot'
