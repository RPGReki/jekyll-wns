module WNS
  module Quads
    MAIN_EXPRESSION = /([\.!?‽”“…])(\r|)\n(?![\n\-\/]|http|>\n)/
    MAIN_REPLACEMENT = "\\1&ensp;"
    CLEANUP_EXPRESSION = /&ensp;( |> )*/
    CLEANUP_REPLACEMENT = "&ensp;"

    def self.enabled?(doc)
      wns = doc.site.config["wns"] || {}
      quads = wns["quads"] || false
    end
 
    def self.insert_quads(input)
      output = input.gsub(MAIN_EXPRESSION, MAIN_REPLACEMENT)
      output = output.gsub(CLEANUP_EXPRESSION, CLEANUP_REPLACEMENT)
    end
    
    def self.insert_quads_into_document!(doc)
      doc.content = insert_quads doc.content
    end
  end
end