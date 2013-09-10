CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],       # required
    :aws_secret_access_key  => ENV["AWS_SECRET_KEY"],       # required
    :region 								=> 'us-west-2'
  }
  config.fog_directory  = ENV["AWS_S3_BUCKET"]
  config.fog_public 		= false
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end