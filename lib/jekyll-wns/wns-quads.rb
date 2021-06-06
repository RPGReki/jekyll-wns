class Quads
  MAIN_EXPRESSION = /([\.!?‽”“…])(\r|)\n(?![\n\-\/]|http|>\n)/
  MAIN_REPLACEMENT = "\\1&ensp;"
  CLEANUP_EXPRESSION = /&ensp;( |> )*/
  CLEANUP_REPLACEMENT = "&ensp;"

  def self.enabled (doc)
    wns = doc.site.config["wns"] || {}
    quads = wns["quads"] || false

    return quads
  end
 
  def self.quads (input)
    output = input.gsub(Quads::MAIN_EXPRESSION, Quads::MAIN_REPLACEMENT)
    output = output.gsub(Quads::CLEANUP_EXPRESSION, Quads::CLEANUP_REPLACEMENT)

    return output
  end
end

Jekyll::Hooks.register :documents, :pre_render do |document|
  if Quads::enabled(document)
    document.content = Quads::quads(document.content)
  end
end

Jekyll::Hooks.register :pages, :pre_render do |document|
  if Quads::enabled(document)
    document.content = Quads::quads(document.content)
  end
end

Jekyll::Hooks.register :posts, :pre_render do |document|
  if Quads::enabled(document)
    document.content = Quads::quads(document.content)
  end
end

module QuadsFilter
  def quads (input)
  end
end

Liquid::Template.register_filter(QuadsFilter)
