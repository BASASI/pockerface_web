require 'fog'
if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = true
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               =>  'AWS',
      :aws_access_key_id      =>  ENV['aws_access_key_id'],
      :aws_secret_access_key  =>  ENV['aws_secret_access_key'],
      :region                 =>  'ap-northeast-1',
      :host                   =>  's3-ap-northeast-1.amazonaws.com',
      :endpoint               =>  'https://s3-ap-northeast-1.amazonaws.com'      #optional, defaults to {}
    }
  end
end
