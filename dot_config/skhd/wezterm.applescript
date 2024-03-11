
on run argv
  set appName to "WezTerm"

-- display dialog (count of argv) as string

  if application appName is running then
    if (count of argv) > 0 then
      -- 引数あり
      do shell script "WEZTERM_UNIX_SOCKET=~/.local/share/wezterm/default-org.wezfurlong.wezterm wezterm cli spawn --new-window " & (item 1 of argv)
    else
      -- 引数なし
      do shell script "WEZTERM_UNIX_SOCKET=~/.local/share/wezterm/default-org.wezfurlong.wezterm wezterm cli spawn --new-window"
    end if

  else
    if (count of argv) > 0 then
      -- 引数あり
      do shell script "/Applications/WezTerm.app/Contents/MacOS/wezterm-gui start " & (item 1 of argv)
    else
      -- 引数なし
      do shell script "/Applications/WezTerm.app/Contents/MacOS/wezterm-gui"
    end if
  end if
end run