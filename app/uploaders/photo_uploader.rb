class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  cloudinary_transformation radius: :max, width: 150, height: 150, crop: :thumb, gravity: :face
  # Remove everything else
end
