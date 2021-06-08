require 'digest/sha2'
module WNS
  module DigestFilters
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
end
