provide-module modeline-extras %{

  # Git branch
  # enable
  define-command modeline-git-branch-enable \
  -docstring 'Enable Git branch option for mode line' %{
    declare-option str modeline_git_branch
    hook -group modeline-git-branch global WinDisplay .* modeline-git-branch-update
  }
  # disable
  define-command modeline-git-branch-disable \
  -docstring 'Disable Git branch option for mode line' %{
    set-option global modeline-git-branch ''
    remove-hooks global modeline-git-branch
  }
  # update
  define-command -hidden modeline-git-branch-update %{
    set-option buffer modeline_git_branch %sh{
      branch=$(cd "${kak_buffile%/*}" 2>/dev/null && git symbolic-ref --short HEAD 2>/dev/null)
      [ $branch ] && printf ' %s' $branch
    }
  }

  # Position in local buffer as Symbol
  # enable
  define-command modeline-buffer-position-enable \
  -docstring 'Enable buffer position option for mode line' %{
    declare-option str modeline_buffer_position
    hook -group modeline-buffer-position global WinCreate .* %{
      hook -group modeline-buffer-position window NormalIdle .* modeline-buffer-position-update
      hook -group modeline-buffer-position window InsertIdle .* modeline-buffer-position-update
    }
  }
  # disable
  define-command modeline-buffer-position-disable \
  -docstring 'Disable buffer position option for mode line' %{
    set-option global modeline_buffer_position ''
    remove-hooks global modeline-buffer-position
  }
  # update
  define-command -hidden modeline-buffer-position-update %{
    set-option window modeline_buffer_position %sh{
      position="$(($kak_cursor_line * 100 / $kak_buf_line_count))%"
        if [ ${position%%%} -ge 90 ]; then
            position="⣀"
        elif [ ${position%%%} -ge 75 ] && [ ${position%%%} -lt 90 ]; then
            position="⣤"
        elif [ ${position%%%} -ge 60 ] && [ ${position%%%} -lt 75 ]; then
            position="⠤"
        elif [ ${position%%%} -ge 45 ] && [ ${position%%%} -lt 60 ]; then
            position="⠶"
        elif [ ${position%%%} -ge 30 ] && [ ${position%%%} -lt 45 ]; then
            position="⠒"
        elif [ ${position%%%} -ge 15 ] && [ ${position%%%} -lt 30 ]; then
            position="⠛"
        elif [ ${position%%%} -lt 15 ]; then
            position="⠉"
        fi
      printf $position
    }
  }

  # Indentwidth
  # enable
  define-command modeline-indent-enable \
  -docstring 'Enable indent option for mode line' %{
    declare-option str modeline_indent
    hook -group modeline-indent global BufSetOption indentwidth=.* modeline-indent-update
  }
  # disable
  define-command modeline-indent-disable \
  -docstring 'Disable indent option for mode line' %{
    set-option global modeline-indent ''
    remove-hooks global modeline-indent
  }
  # update
  define-command -hidden modeline-indent-update %{
    set-option buffer modeline_indent %sh{
      if [ $kak_opt_indentwidth -eq 0 ]; then
        printf ' '
      else
        printf '%s␣' $kak_opt_indentwidth
      fi
    }
  }

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

  
}
