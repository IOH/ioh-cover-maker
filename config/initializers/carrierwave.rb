CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJJAXACMM3P4X3XVA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-southeast-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'ioh-cover-maker'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
