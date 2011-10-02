CarrierWave.configure do |config|

#  config.storage = :s3
#  config.s3_access_key_id = 'AKIAJD4H3NUBLUCC7QJQ'
#  config.s3_secret_access_key = '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'
#  config.s3_bucket = 'advicecapital'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJD4H3NUBLUCC7QJQ',
    :aws_secret_access_key  => 'WiitrI60zT3RkSdiNb8jFoeTl2OrDzUnJp+rfQbM'
  }
  config.fog_directory  = 'advicecapital'
  #config.fog_host       = 'https://assets.example.com'
  #config.fog_public     = false
  #config.f
end