module WNS
  module Abbreviations
    INNER_DOTS_EXPRESSION = /([a-zA-Z]\.)([a-zA-Z]\.)([a-zA-Z]\.|)([a-zA-Z]\.|)([a-zA-Z]\.|)(,|) /
    INNER_DOTS_REPLACEMENT = "\\1&#8239;\\2&#8239;\\3&#8239;\\4&#8239;\\5&#8239;\\6&nbsp;"

    TITLE_EXPRESSION = /(Mr|Ms|Mrs|Messrs|Mmes|Msgr|Prof|Rev|Dr|Sr|St|[A-Z][a-z]|[A-Z][a-z][a-z])(\.|\.,|,) /
    TITLE_REPLACEMENT = "\\1\\2&nbsp;"
    
    PREFIX_EXPRESSION = /, ([a-zA-Z]\.&)/
    PREFIX_REPLACEMENT = ",&nbsp;\\1"

    COLLAPSE_SPACES_EXPRESSION = /(&#8239;)*(&nbsp;|,)/
    COLLAPSE_SPACES_REPLACEMENT = "\\2"

    def self.enabled?(doc)
      wns = doc.site.config["wns"] || {}
      wns["abbreviations"] || false
    end

    def self.replace_abbreviations!(doc)
      if Abbreviations::enabled?(doc)
        doc.content = doc.content.gsub(Abbreviations::INNER_DOTS_EXPRESSION, Abbreviations::INNER_DOTS_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::TITLE_EXPRESSION, Abbreviations::TITLE_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::PREFIX_EXPRESSION, Abbreviations::PREFIX_REPLACEMENT)
        doc.content = doc.content.gsub(Abbreviations::COLLAPSE_SPACES_EXPRESSION, Abbreviations::COLLAPSE_SPACES_REPLACEMENT)
      end
    end
  end
end
