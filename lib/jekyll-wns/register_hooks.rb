Jekyll::Hooks.register :documents, :pre_render do |document|
  WNS::Abbreviations::replace_abbreviations! document
end

Jekyll::Hooks.register :pages, :pre_render do |document|
  WNS::Abbreviations::replace_abbreviations! document
end

Jekyll::Hooks.register :posts, :pre_render do |document|
  WNS::Abbreviations::replace_abbreviations! document
end
