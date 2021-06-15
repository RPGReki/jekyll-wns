module WNS
  module Abbreviations
    THREE_LETTER_EXPRESSION = /([a-zA-Z]\.)([a-zA-Z]\.)([a-zA-Z]\.)(,|) /
    THREE_LETTER_REPLACEMENT = "\\1&#8239;\\2&#8239;\\3\\4&nbsp;"

    TWO_LETTER_EXPRESSION = /([a-zA-Z]\.)([a-zA-Z]\.)(,|) /
    TWO_LETTER_REPLACEMENT = "\\1&#8239;\\2\\3&nbsp;"

    TITLE_EXPRESSION = /(Mr|Ms|Mrs|Messrs|Mmes|Msgr|Prof|Rev|Dr|Sr|St|[A-Z][a-z]|[A-Z][a-z][a-z])(\.|)(,|) /
    TITLE_REPLACEMENT = "\\1\\2\\3&nbsp;"
    
    PREFIX_EXPRESSION = /, ([a-zA-Z]\.&)/
    PREFIX_REPLACEMENT = ",&nbsp;\\1"

    def self.enabled?(doc)
      wns = doc.site.config["wns"] || {}
      wns["abbreviations"] || false
    end

    def self.replace_abbreviations!(doc)
      if Abbreviations::enabled?(doc)
        doc.content = doc.content.gsub(Abbreviations::THREE_LETTER_EXPRESSION, Abbreviations::THREE_LETTER_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::TWO_LETTER_EXPRESSION, Abbreviations::TWO_LETTER_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::TITLE_EXPRESSION, Abbreviations::TITLE_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::PREFIX_EXPRESSION, Abbreviations::PREFIX_REPLACEMENT)
      end
    end
  end
end
