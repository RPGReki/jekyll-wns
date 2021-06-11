module WNS
  class RubyTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super

      @text = text.strip!.split("|")
    end

    def render(context)
      base = @text[0].split("#")
      text = @text[1].split("#")
      output = "<ruby>"
      i = 0
      while i < base.length()
        output += "<span class='rb" + (i == 0 ? " first" : "") + (i == base.length() - 1 ? " last" : "") + "' aria-hidden='true'>#{base[i]}</span><rp>(</rp><rt" + (i == 0 ? " first" : "") + (i == base.length() - 1 ? " last" : "") + ">#{text[i]}</rt><rp>)</rp>"
        i += 1
      end
      output += "</ruby>"
    end 
  end
end
