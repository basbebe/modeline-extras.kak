# modeline-extras.kak

A collection of additional options for [Kakoune]'s native [status line].

# Installation

Add `modeline-extras.kak` to the plugin manager of your choice, put it into yout autoload or source it manually.

Using [alexherbo2/plug.kak]:
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

This plugins makes the following options available for `modelinefmt`:
- `modeline_nerdfont`: Enable [Nerd Fonts] symbols. Default: `false`.

- `modeline_buffer_position`: Shows the current buffer position as a symbol [(source)][powerline]
- `modeline_codepoint`: Shows the [Unicode] [code point] of the current cursor position [(source)][status line-codepoint]
- `modeline_git_branch`: Shows the current Git branch
- `modeline_indent`: Shows the number of spaces set as indentwidth for the current buffer or a tabstop-symbol.
- `modeline_lsp_err`: Shows the number of errors by [kak-lsp]
- `modeline_lsp_warn`: Shows the number of warnings by [kak-lsp]

Every option needs to be enabled first with it's corresponding command:

```sh
modeline-buffer-position-enable
modeline-codepoint-enable
modeline-git-branch-enable
modeline-indent-enable
modeline-lsp-enable
```

Use [faces] or [markup strings] to change colors and attributes.

### Example config

```sh
plug modeline-extras git/modeline-extras.kak %{
  # enable Nerd Font symbols
  set-option global modeline-nerdfont true

  # enable options
  modeline-buffer-position-enable
  modeline-git-branch-enable
  modeline-indent-enable
  modeline-lsp-enable

  # Git branch + Filename
  set-option global modelinefmt '{magenta+i}%opt{modeline_git_branch} {bright-blue+u}%val{bufname}{default}'
  # Position
  set-option -add global modelinefmt ' %val{cursor_line}:%val{cursor_char_column} %opt{modeline_buffer_position}{default}'
  # Context Info + Mode Info
  set-option -add global modelinefmt ' {{context_info}} {{mode_info}}'
  # lsp
  set-option -add global modelinefmt ' {DiagnosticError}%opt{modeline_lsp_err}{DiagnosticWarning}%opt{modeline_lsp_warn}{default}'
  # Filetype + Indentwidth
  set-option -add global modelinefmt ' %opt{filetype} %opt{modeline_indent}'
  # client@session
  set-option -add global modelinefmt ' {bright-cyan}%val{client}{bright-cyan+b}%val{session}'
}
```

![preview image]

## Similar projects

- [out-of-view.kak]: Show out of view selections

## Contributing
Pull requests are welcome.

## License
[The Unlicense]


[alexherbo2/plug.kak]: https://github.com/alexherbo2/plug.kak
[builtin-options]: https://github.com/mawww/kakoune/blob/master/doc/pages/options.asciidoc#builtin-options
[code point]: https://en.wikipedia.org/wiki/Code_point
[faces]: https://github.com/mawww/kakoune/blob/master/doc/pages/faces.asciidoc#faces
[kak-lsp]: https://github.com/kak-lsp/kak-lsp/
[Kakoune]: https://kakoune.org/
[markup strings]: https://github.com/mawww/kakoune/blob/master/doc/pages/faces.asciidoc#markup-strings
[Nerd Fonts]: https://www.nerdfonts.com/#home
[out-of-view.kak]: https://github.com/alexherbo2/out-of-view.kak
[powerline]: https://github.com/andreyorst/powerline.kak
[preview image]: https://user-images.githubusercontent.com/7083188/107636049-fc933500-6c63-11eb-9a92-19ddfbd0c0dd.png
[status line]: https://github.com/mawww/kakoune/wiki/Status-line
[status line-codepoint]: https://github.com/mawww/kakoune/wiki/Status-line#codepoint-of-the-character-under-the-cursor
[The Unlicense]: https://choosealicense.com/licenses/unlicense/
[Unicode]: https://en.wikipedia.org/wiki/Unicode
