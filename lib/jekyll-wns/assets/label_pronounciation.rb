module WNS
  module LabelPronounciation

    def self.enabled?(doc)
      wns = doc.site.config["wns"] || {}
      labels = wns["label_pronounciation"] || []
      labels.length > 0
    end

    def self.label_pronounciation!(doc)
      wns = doc.site.config["wns"] || {}
      labels = wns["label_pronounciation"] || false
      for i in (0..(labels.length()) - 1) do
        doc.content = doc.content.gsub(Regexp.new("\b(#{labels[i]["term"]})\b"), "<span aria-label='#{labels[i]["pronounciation"]}'>\\1</span>")
      end
    end
  end
end
