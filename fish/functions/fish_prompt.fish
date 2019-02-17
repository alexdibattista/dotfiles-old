# name: clearance
# ---------------
# Based on idan. Display the following bits on the left:
# - Virtualenv name (if applicable, see https://github.com/adambrenecki/virtualfish)
# - Current directory name
# - Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt
  set -l last_status $status

  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l cwd $blue(pwd | sed "s:^$HOME:~:")

  # Output the prompt, left to right

  # Add a newline before new prompts
  echo -e ''

  # Display [venvname] if in a virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b cyan black) '[' (basename "$VIRTUAL_ENV") ']' $normal ' '
  end

  # Print pwd or full path
  echo -n -s $cwd $normal

  # Show git branch and status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_info '(' $yellow $git_branch "±" $normal ')'
    else
      set git_info '(' $green $git_branch $normal ')'
    end
    echo -n -s ' · ' $git_info $normal
  end

  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  # Terminate with a nice prompt char
  echo -e ''
  echo -e -n -s $prompt_color '⟩ ' $normal
end

function gh --description 'Open the webpage for the current github repo/branch'
  set -l fetch_url (command git remote --verbose show -n origin ^/dev/null | command grep Fetch | cut -c 14- )

  #did we get an exit status?
  if [ $status -gt 0 ]
    echo 'Not a git repo.'
    return 1
  end

  if [ -z $fetch_url ]
    echo 'Not a git repo.'
    return 1
  end

  if [ -z (echo $fetch_url | grep github ) ]
    echo 'Not a github repo.'
    return 3
  end

  set -l branch (command git rev-parse --abbrev-ref HEAD)

  if [ $branch = 'HEAD' ]
    # we couldn't find a branch or tag, so lets get a sha
    set branch (command git rev-parse HEAD)
  end

  set url (echo "$fetch_url/tree/$branch" | sed 's|git@github.com:\(.*\)\.git|https://github.com/\1|')

  open "$url/$argv"
end
