require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     "#{ENV['AWS_KEY']}",                # required
    aws_secret_access_key: "#{ENV['AWS_SECRET']}",                # required
    region:                  'ap-northeast-2',            # optional, defaults to nil
  }
  config.fog_directory  = 'kookbong'                          # required
end