module WNS
  module Quads
    MAIN_EXPRESSION = /([\.!?‽”“…])(\r|)\n(?![\n\-\/]|http|>\n)/
    MAIN_REPLACEMENT = "\\1&ensp;"
    CLEANUP_EXPRESSION = /&ensp;( |> )*/
    CLEANUP_REPLACEMENT = "&ensp;"

    def enabled?(doc)
      wns = doc.site.config["wns"] || {}
      quads = wns["quads"] || false
    end
 
    def quads(input)
      output = input.gsub(MAIN_EXPRESSION, MAIN_REPLACEMENT)
      output = output.gsub(CLEANUP_EXPRESSION, CLEANUP_REPLACEMENT)
    end
  end
end