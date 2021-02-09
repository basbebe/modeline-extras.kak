
  # Unicode code point
  # https://en.wikipedia.org/wiki/Unicode
  # https://en.wikipedia.org/wiki/Code_point
  # enable
  define-command modeline-codepoint-enable \
  -docstring 'Enable codepoint option for mode line' %{
    declare-option str modeline_codepoint
    hook -group modeline-codepoint global WinCreate .* %{
      hook -group modeline-codepoint window NormalIdle .* modeline-codepoint-update
      hook -group modeline-codepoint window InsertIdle .* modeline-codepoint-update
    }
  }
  # disable
  define-command modeline-codepoint-disable \
  -docstring 'Disable codepoint option for mode line' %{
    set-option global modeline-codepoint ''
    remove-hooks global modeline-codepoint
  }
  # update
  define-command -hidden modeline-codepoint-update %{
    set-option buffer modeline_codepoint 'U+%sh{printf ''%04x'' "$kak_cursor_char_value"}'
  }

  
