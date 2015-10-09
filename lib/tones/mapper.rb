module ActionDispatch::Routing
  class Mapper
    def tone_resources
      mount Tones::Engine => "/"
    end
  end
end 