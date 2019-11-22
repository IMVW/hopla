class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  cloudinary_transformation radius: :max, width: 250, height: 250, crop: :thumb, gravity: :face
  # Remove everything else
end
