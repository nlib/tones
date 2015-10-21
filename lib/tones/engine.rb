require 'tones/view_helpers'
module Tones
  class Engine < ::Rails::Engine
    isolate_namespace Tones

    initializer "tones.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
      ActionController::Base.send :include, ViewHelpers
    end

  end
end
