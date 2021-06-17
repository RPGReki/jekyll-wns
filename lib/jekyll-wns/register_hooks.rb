Jekyll::Hooks.register :pages, :pre_render do |document|
  if document.path =~ /(.md|.html)/
    WNS::Abbreviations::replace_abbreviations! document
    WNS::LabelUnicode::label_unicode! document
    WNS::Quads::insert_quads_into_document! document
  end
end

Jekyll::Hooks.register :pages, :post_render do |document|
  if document.path =~ /(.md|.html)/
    true
  end
end

Jekyll::Hooks.register :posts, :pre_render do |document|
  WNS::Abbreviations::replace_abbreviations! document
  WNS::LabelUnicode::label_unicode! document
  WNS::Quads::insert_quads_into_document! document
end

Jekyll::Hooks.register :posts, :post_render do |document|
  true
end
