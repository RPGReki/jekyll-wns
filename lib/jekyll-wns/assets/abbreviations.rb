module WNS
  module Abbreviations
    MAIN_EXPRESSION = /([a-zA-Z])\.([a-zA-Z])\.(,|) /
    MAIN_REPLACEMENT = "\\1.&#8239;\\2.\\3&nbsp;"
    CLEANUP_EXPRESSION = /, ([a-zA-Z]\.&)/
    CLEANUP_REPLACEMENT = ",&nbsp;\\1"

    def enabled?(doc)
      wns = doc.site.config["wns"] || {}
      wns["abbreviations"] || false
    end

    def replace_abbreviations!(doc)
      if Abbreviations::enabled?(doc)
        doc.content = doc.content.gsub(Abbreviations::MAIN_EXPRESSION, Abbreviations::MAIN_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::CLEANUP_EXPRESSION, Abbreviations::CLEANUP_REPLACEMENT)
      end
    end
  end
end
