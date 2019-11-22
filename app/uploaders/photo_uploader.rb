class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 256, 256
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
    width: 150, height: 150, crop: :thumb, gravity: :face
  end

  cloudinary_transformation radius: :max, width: 250, height: 250, crop: :thumb, gravity: :face
  # Remove everything else
end
