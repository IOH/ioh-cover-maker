# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


Rails.application.config.assets.precompile += %w( jquery.cropit.js )

Rails.application.config.assets.precompile += %w( cover-maker.js.erb )

Rails.application.config.assets.precompile += %w( cover-maker.css )

Rails.application.config.assets.precompile += %w( posterIndex.js.erb )


#images

Rails.application.config.assets.precompile += %w( place-holder-1920x860.png )
Rails.application.config.assets.precompile += %w( place-holder-320x320.png )
Rails.application.config.assets.precompile += %w( camera3.png )
Rails.application.config.assets.precompile += %w( IOH-banner.png )
Rails.application.config.assets.precompile += %w( ioh-favicon.ico )
Rails.application.config.assets.precompile += %w( logo.png )
Rails.application.config.assets.precompile += %w( arrows.png )
Rails.application.config.assets.precompile += %w( arrows_hover.png )
Rails.application.config.assets.precompile += %w( processing.gif )
