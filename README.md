# jekyll-wns

A collection of filters, tags and hooks that I use on my pages.

## Installation

1. Run ̀ bundle add jekyll-wns` and
2. Add the following to your site's `_config.yml`:

```yml
plugins:
  - jekyll-wns
```

## Usage

### Filters

#### Checksums

```liquid
{{ site.content | sha384_64 }}
```

```liquid
{{ site.content | sha384 }}
```

```liquid
{{ site.content | sha256_64 }}
```

```liquid
{{ site.content | sha256 }}
```

#### File Size

```liquid
{{ site.content | file_size }}
```

### Tags

#### Scene Breaks

```liquid
{% scene_break leaves %}
```

```html
<p style="text-align:center" data-mce-style="text-align:center">🙐 🙑 🙓 🙒 🙐 🙑 🙓 🙒 🙐 🙑 🙓 🙒</p>
```

```liquid
{% scene_break wave %}
```

```html
<p style="text-align:center;letter-spacing:-.13em" data-mce-style="text-align:center;letter-spacing:-.13em">◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠◡◠‏</p>
```

```liquid
{% scene_break wall %}
```

```html
<p style="text-align:center;letter-spacing:-.2em" data-mce-style="text-align:center;letter-spacing:-.2em">‎⚎‏⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎⚍‎⚎</p>
```

```liquid
{% scene_break %}
```

```html
<p style="text-align:center" data-mce-style="text-align:center">🙿🙾🙿🙾🙿🙾🙿🙾
```

#### Ruby Annotations

```liquid
{% ruby b|t %}

{% ruby a#b|t#s %}

{% ruby a#b#c|x#y#z %}
```

```html
<p><ruby><span class="rb first last" aria-hidden="true">b</span><rp>(</rp><rt first="" last="">t</rt><rp>)</rp></ruby></p>

<p><ruby><span class="rb first" aria-hidden="true">a</span><rp>(</rp><rt first="">t</rt><rp>)</rp><span class="rb last" aria-hidden="true">b</span><rp>(</rp><rt last="">s</rt><rp>)</rp></ruby></p>

<p><ruby><span class="rb first" aria-hidden="true">a</span><rp>(</rp><rt first="">x</rt><rp>)</rp><span class="rb" aria-hidden="true">b</span><rp>(</rp><rt>y</rt><rp>)</rp><span class="rb last" aria-hidden="true">c</span><rp>(</rp><rt last="">z</rt><rp>)</rp></ruby></p>
```

#### YouTube Embed

The following snippet should be integrated into your site for the tag to properly work:

```javascript
function loadYouTube() {
  var videos = d.getElementsByClassName('youtube');
  for (var i = 0; i < videos.length; i++) {
    videos[i].innerHTML = d.getElementById(videos[i].getAttribute('data-videoid')).innerHTML;
  }
}
```

```liquid
{% youtube U6xJfP7-HCc|Base 12 — Numberphile %}
```

```html
<div class="youtube" data-videoid="youtube-U6xJfP7-HCc">
  <a class="btn btn-lg btn-block btn-primary" href="https://youtu.be/U6xJfP7-HCc" target="_blank" rel="noopener">
    Watch “Base 12 — Numberphile” on YouTube
  </a>
  <a class="btn btn-lg btn-block btn-primary" href="javascript:loadYouTube();">
    Load YouTube Video (3rd party script)
  </a>
</div>
<script id="youtube-U6xJfP7-HCc" type="text/html">
  <div style='position: relative; padding-bottom: 56.25%; padding-top: 30px; height: 0; overflow: hidden;'>
    <iframe
      style='position: absolute; top: 0; left: 0; width: 100%; height: 100%;'
      src='https://www.youtube-nocookie.com/embed/U6xJfP7-HCc?rel=0'
      frameborder='0'
      allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'
      allowfullscreen></iframe>
  </div>
</script>
```

### Hooks

#### Automatic replacement of spaces to en quads after each sentence

Assuming your files are each sentence in their own line,
just add this to your `_config.yml`:

```yml
wns:
  quads: true
```

#### Automatic typographic handling of abbreviations

Just omit the space between the letters and use normal spaces, then add this to your `_config.yml`:

```yml
wns:
  abbrevations: true
```

##### Example

```html
… tools, e.g., hammer,…
```

With `abbreviations: true`:

```html
… tools,&nbsp;e.&#8239;\g.,&nbsp;hammer,…
```
