# jekyll-wns

A collection of filters, tags and hooks that I use on my pages.

## Installation

1. Add `gem "jekyll-wns", git: "https://github.com/0xReki/jekyll-wns.git, branch: "main"` to your site's Gemfile and run `bundle`
2. Add the following to your site's `_config.yml`:

```yml
gems:
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
̀ ``

With `abbreviations: true`

```html
… tools,&nbsp;e.&#8239;\g.,&nbsp;hammer,…
```
