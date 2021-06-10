module WNS
  class YoutubeTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip!.split("|")
    end

    def render(context)
      "<div class='youtube' data-videoid='youtube-" + @text[0] + "'>
  <a class='btn btn-lg btn-block btn-primary' href='https://youtu.be/" + @text[0] + "' target='_blank' rel='noopener'>
    Watch “" + @text[1] + "” on YouTube
  </a>
  <a class='btn btn-lg btn-block btn-primary' 
      href='javascript:loadYouTube();'>
    Load YouTube Video (3rd party script)
  </a>
</div>
<script id='youtube-" + @text[0] + "' type='text/html'>
  <div style='position: relative; padding-bottom: 56.25%; padding-top: 30px; height: 0; overflow: hidden;'>
    <iframe
      style='position: absolute; top: 0; left: 0; width: 100%; height: 100%;'
      src='https://www.youtube-nocookie.com/embed/" + @text[0] + "?rel=0'
      frameborder='0'
      allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'
      allowfullscreen></iframe>
  </div>
</script>"
    end 
  end
end
