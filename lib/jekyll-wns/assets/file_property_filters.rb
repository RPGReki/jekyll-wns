require 'mp3info'

module WNS
  module FilePropertyFilters
    def file_size(path)
      source = Jekyll.configuration({})['source']
      
      unless source.blank?
        source += '/'
      else 
        source = ''
      end 
      full_path = source + path

      unless path.nil?
        File.size full_path
      else
        0
      end
    end
    
    def mp3_duration(path)
      source = Jekyll.configuration({})['source']
      
      unless source.blank?
        source += '/'
      else 
        source = ''
      end 
      full_path = source + path

      unless path.nil?
        Mp3Info.open(full_path).length.to_i
      else
        0
      end
    end
  end
end
