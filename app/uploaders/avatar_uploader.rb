# encoding: utf-8

class AvatarUploader < BaseUploader

  process :resize_to_limit => [200, 200]
  
  version :small do
    process :resize_to_fill => [32, 32]
  end

  version :medium do
    process :resize_to_fill => [48, 48]
  end

  version :large do
    process :resize_to_fill => [164, 164]
  end
end
