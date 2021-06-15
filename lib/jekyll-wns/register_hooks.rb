# Jekyll::Hooks.register :documents, :pre_render do |document|
#  WNS::Abbreviations::replace_abbreviations! document
#  WNS::LabelUnicode::label_unicode! document
#  WNS::Quads::insert_quads_into_document! document
#end

Jekyll::Hooks.register :pages, :pre_render do |document|
  WNS::Abbreviations::replace_abbreviations! document
  WNS::LabelUnicode::label_unicode! document
  WNS::Quads::insert_quads_into_document! document
end

Jekyll::Hooks.register :posts, :pre_render do |document|
  WNS::Abbreviations::replace_abbreviations! document
  WNS::LabelUnicode::label_unicode! document
  WNS::Quads::insert_quads_into_document! document
end
