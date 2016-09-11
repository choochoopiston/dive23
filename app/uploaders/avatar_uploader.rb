# encoding: utf-8

class AvatarUploader < BaseUploader

  process :resize_to_limit => [200, 200]
  
  version :small do
    process :resize_to_fit => [32, 32]
  end

  version :medium do
    process :resize_to_fit => [48, 48]
  end

  version :large do
    process :resize_to_fit => [164, 164]
  end
end
