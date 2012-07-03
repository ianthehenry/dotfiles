set PATH ""/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/git/bin:$PATH""
set NODE_PATH ""/usr/local/lib/node_modules""
set VISUAL ""subl -w""

function subl.
	subl . $argv
end;

function lust
	ssh ian@lust.cs.utexas.edu $argv
end;

function ls --description 'List contents of directory'
  command ls -F $argv
end;

function la --description 'List contents of directory, including hidden files in directory'
  ls -AF $argv
end

function ll --description 'List contents of directory, including hidden files in directory, in long format'
  ls -lAF $argv
end

function fish_prompt --description 'Write out the prompt'

  # Just calculate these once, to save a few cycles when displaying the prompt

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  switch $USER

    case root

    if not set -q __fish_prompt_cwd
      if set -q fish_color_cwd_root
        set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
      else
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
      end
    end

    echo -n -s "$__fish_prompt_cwd" (prompt_pwd) ' → ' "$__fish_prompt_normal"

    case '*'

    if not set -q __fish_prompt_cwd
      set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    echo -n -s "$__fish_prompt_cwd" (prompt_pwd) ' → ' "$__fish_prompt_normal"

  end
end
