require 'digest/sha2'

module SHA2Hash
  def sha256_64(input)
    Digest::SHA256.base64digest input
  end

  def sha384_64(input)
    Digest::SHA384.base64digest input
  end

  def sha256(input)
    Digest::SHA256.hexdigest input
  end

  def sha384(input)
    Digest::SHA384.hexdigest input
  end
end

module FileProperties
  def file_size(path)
      File.size(path)
  end
end

Liquid::Template.register_filter(SHA2Hash)
Liquid::Template.register_filter(FileProperties)
