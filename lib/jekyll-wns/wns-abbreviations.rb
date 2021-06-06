class Abbreviations
  MAIN_EXPRESSION = /([a-zA-Z])\.([a-zA-Z])\.(,|) /
  MAIN_REPLACEMENT = "\\1.&#8239;\\2.\\3&nbsp;"
  CLEANUP_EXPRESSION = /, ([a-zA-Z]\.&)/
  CLEANUP_REPLACEMENT = ",&nbsp;\\1"

  def self.enabled (doc)
    wns = doc.site.config["wns"] || {}
    quads = wns["abbreviations"] || false
    return quads
  end
end

Jekyll::Hooks.register :documents, :pre_render do |document|
  if Abbreviations::enabled(document)
    document.content = document.content.gsub(Abbreviations::MAIN_EXPRESSION, Abbreviations::MAIN_REPLACEMENT)
    document.content = document.content.gsub(Abbreviations::CLEANUP_EXPRESSION, Abbreviations::CLEANUP_REPLACEMENT)
  end

end

Jekyll::Hooks.register :pages, :pre_render do |document|
  if Abbreviations::enabled(document)
    document.content = document.content.gsub(Abbreviations::MAIN_EXPRESSION, Abbreviations::MAIN_REPLACEMENT)
    document.content = document.content.gsub(Abbreviations::CLEANUP_EXPRESSION, Abbreviations::CLEANUP_REPLACEMENT)
  end
end

Jekyll::Hooks.register :posts, :pre_render do |document|
  if Abbreviations::enabled(document)
    document.content = document.content.gsub(Abbreviations::MAIN_EXPRESSION, Abbreviations::MAIN_REPLACEMENT)
    document.content = document.content.gsub(Abbreviations::CLEANUP_EXPRESSION, Abbreviations::CLEANUP_REPLACEMENT)
  end
end
