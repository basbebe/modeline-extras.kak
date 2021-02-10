# modeline-extras.kak

additional options for [Kakoune](https://kakoune.org/)'s native [mode line](https://github.com/mawww/kakoune/blob/master/doc/pages/options.asciidoc#builtin-options).

# Installation

Add `modeline-extras.kak` to the plugin manager of your choise, put it into yout autoload or source it manually.

Using [alexherbo2/plug.kak](https://github.com/alexherbo2/plug.kak):
```sh
plug modeline-extras https://github.com/basbebe/modeline-extras.kak %{
  #your config
}
```

Otherwise:
```sh
require-module modeline-extras
```

## Usage

This plugins makes the following options available:

- `modeline_git_branch`: shows the current Git branch
- `modeline_buffer_position`: shows the current buffer position as a symbol
- `modeline_indent`: shows the number of spaces set as indentwidth for the current buffer or a tabstop-symbol.
- `modeline_codepoint`: shows the [Unicode](https://en.wikipedia.org/wiki/Unicode) [code point](https://en.wikipedia.org/wiki/Code_point) of the current cursor position

Every option needs to be enabled first with it's corresponding command:

```sh
modeline-git-branch-enable
modeline-buffer-position-enable
modeline-indent-enable
modeline-codepoint-enable
```

Use [faces](https://github.com/mawww/kakoune/blob/master/doc/pages/faces.asciidoc#faces) or [markup strings](https://github.com/mawww/kakoune/blob/master/doc/pages/faces.asciidoc#markup-strings) to change colors and attributes.

### Example config

```sh
plug modeline-extras git/modeline-extras.kak %{
  modeline-git-branch-enable
  modeline-buffer-position-enable
  modeline-indent-enable

  # Git branch + Filename
  set-option global modelinefmt '{magenta+i}%opt{modeline_git_branch} {bright-blue+u}%val{bufname}{default}'
  # Position
  set-option -add global modelinefmt ' %val{cursor_line}:%val{cursor_char_column} %opt{modeline_buffer_position}{default}'
  # Context Info + Mode Info
  set-option -add global modelinefmt ' {{context_info}} {{mode_info}}'
  # Filetype + Indentwidth
  set-option -add global modelinefmt ' %opt{filetype} %opt{modeline_indent}'
  # client@session
  set-option -add global modelinefmt ' {bright-cyan}%val{client}{bright-cyan+b}%val{session}'
}
```

## Similar projects

- [out-of-view.kak](https://github.com/alexherbo2/out-of-view.kak): Show out of view selections

## Contributing
Pull requests are welcome.

## License
[The Unlicense](https://choosealicense.com/licenses/unlicense/)
