module Tones
  module ViewHelpers

    def to(name, p = [])
      Tones::Tone.content(name, p)
    end

  end
end

