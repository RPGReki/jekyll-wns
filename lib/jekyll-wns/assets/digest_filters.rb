require 'digest/sha2'
module WNS
  module DigestFilters
    def sha256_64(input)
      unless input.nil?
        Digest::SHA256.base64digest input
      else 
        ""
      end
    end

    def sha384_64(input)
      unless input.nil?
        Digest::SHA384.base64digest input
      else 
        ""
      end
    end

    def sha256(input)
      unless input.nil?
       Digest::SHA256.hexdigest input
      else 
        ""
      end
    end

    def sha384(input)
      unless input.nil?
        Digest::SHA384.hexdigest input
      else 
        ""
      end
    end
  end
end
