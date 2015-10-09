require 'test_helper'
require 'generators/tones/tones_generator'

module Tones
  class TonesGeneratorTest < Rails::Generators::TestCase
    tests TonesGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
