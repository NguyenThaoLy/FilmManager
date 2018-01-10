class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  version :large do
    process resize_to_limit: [800,800]
  end

  version :medium, from_version: :large do
    process resize_to_limit: [400,400]
  end

  version :small, from_version: :medium do
    process resize_to_fill: [150, 150]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
