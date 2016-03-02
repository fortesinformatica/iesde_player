module IesdePlayer
  class Engine < ::Rails::Engine
    isolate_namespace IesdePlayer

    config.to_prepare do
      ::ActionController::Base.helper(VideoHelper)
    end
    config.assets.paths << File.expand_path("../../assets/flash", __FILE__)
    config.assets.paths << File.expand_path("../../assets/images", __FILE__)
    config.assets.precompile += %w( Player.swf )
    config.assets.precompile += %w( defaultLoadImage.png )
  end
end
