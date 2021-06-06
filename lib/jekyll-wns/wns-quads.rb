class Quads
  MAIN_EXPRESSION = /([\.!?‽”“…])\n(?![\n\-\/]|http|>\n)/
  MAIN_REPLACEMENT = "\\1&ensp;"
  CLEANUP_EXPRESSION = /&ensp;( |> )*/
  CLEANUP_REPLACEMENT = "&ensp;"

  def self.enabled (doc)
    wns = doc.site.config["wns"] || {}
    quads = wns["quads"] || false
    return quads
  end
end

Jekyll::Hooks.register :documents, :pre_render do |document|
  if Quads::enabled(document)
    document.content = document.content.gsub(Quads::MAIN_EXPRESSION, Quads::MAIN_REPLACEMENT)
    document.content = document.content.gsub(Quads::CLEANUP_EXPRESSION, Quads::CLEANUP_REPLACEMENT)
  end

end

Jekyll::Hooks.register :pages, :pre_render do |document|
  if Quads::enabled(document)
    document.content = document.content.gsub(Quads::MAIN_EXPRESSION, Quads::MAIN_REPLACEMENT)
    document.content = document.content.gsub(Quads::CLEANUP_EXPRESSION, Quads::CLEANUP_REPLACEMENT)
  end
end

Jekyll::Hooks.register :posts, :pre_render do |document|
  if Quads::enabled(document)
    document.content = document.content.gsub(Quads::MAIN_EXPRESSION, Quads::MAIN_REPLACEMENT)
    document.content = document.content.gsub(Quads::CLEANUP_EXPRESSION, Quads::CLEANUP_REPLACEMENT)
  end
end
