<<<<<<< HEAD
Panda.configure((ENV['PANDASTREAM_URL'] || YAML::load_file(File.join(File.dirname(__FILE__),"..", "panda.yml"))[Rails.env]))

Panda.configure do |config|
	# config.storage = :s3
	# config.s3_access_key_id = 'AKIAJD4H3NUBLUCC7QJQ'
	# config.s3_secret_access_key = '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'
	# config.s3_bucket = 'advicecapital'
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_access_key_id => 'AKIAJD4H3NUBLUCC7QJQ',
    :aws_secret_access_key => 'WiitrI60zT3RkSdiNb8jFoeTl2OrDzUnJp+rfQbM'
  }
  config.fog_directory = 'advicecapital'
  #config.fog_host = 'https://assets.example.com'
  #config.fog_public = false
  #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
=======
Panda.configure((ENV['PANDASTREAM_URL'] || YAML::load_file(File.join(File.dirname(__FILE__),"..", "panda.yml"))[Rails.env]))
>>>>>>> 0d4f9df36ed0fcc89fcd257c51cf3a0348f51429
