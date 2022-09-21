module WNS
  class SceneBreakTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super

      @text = text.strip!
    end

    def render(context)
      case @text
      when "ice"
        '<p style="text-align:center" data-mce-style="text-align:center" aria-hidden="true">❄ ❅ ❆ ❄ ❅ ❆ ❄ ❅ ❆ ❄ ❅ ❆</p>'
      when "leaves"
        '<p style="text-align:center" data-mce-style="text-align:center" aria-hidden="true">🙐 🙑 🙓 🙒 🙐 🙑 🙓 🙒 🙐 🙑 🙓 🙒</p>'
      when "wave"
        '<p style="text-align:center;letter-spacing:-.13em" data-mce-style="text-align:center;letter-spacing:-.13em" aria-hidden="true">◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠</p>'
      when "wall"
        '<p style="text-align:center;letter-spacing:-.2em" data-mce-style="text-align:center;letter-spacing:-.2em" aria-hidden="true">⚎⚍⚎⚍⚎⚍⚎⚍⚎⚍⚎⚍⚎⚍⚎⚍⚎⚍⚎⚍</p>'
      else
        '<p style="text-align:center" data-mce-style="text-align:center" aria-hidden="true">🙿🙾🙿🙾🙿🙾🙿🙾🙿🙾🙿🙾🙿🙾🙿</p>'
      end
    end 
  end
end
