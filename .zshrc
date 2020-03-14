
# Changing directories {{{
setopt auto_cd
setopt auto_pushd
setopt no_cdable_vars
setopt chase_dots
setopt nochase_links
setopt posix_cd
setopt no_pushd_ignore_dups
setopt no_pushd_minus
setopt pushd_silent
setopt pushd_to_home
# }}}
# Completion {{{
setopt always_last_prompt
setopt no_always_to_end
setopt auto_menu
setopt no_auto_name_dirs
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt bash_auto_list
setopt complete_aliases
setopt no_complete_in_word
setopt glob_complete
setopt hash_list_all
setopt list_ambiguous
setopt no_list_beep
setopt list_packed
setopt list_rows_first
setopt list_types
setopt no_menu_complete
setopt no_rec_exact
# }}}
# Expansion and Globbing {{{
setopt bad_pattern
setopt bare_glob_qual
setopt no_brace_ccl
setopt no_case_glob
setopt no_case_match
setopt no_csh_null_glob
setopt equals
setopt extended_glob
setopt no_force_float
setopt glob
setopt no_glob_assign
setopt glob_dots
setopt no_glob_star_short
setopt no_glob_subst
setopt no_hist_subst_pattern
setopt no_ignore_braces
setopt no_ignore_close_braces
setopt no_ksh_glob
setopt no_magic_equal_subst
setopt mark_dirs
setopt no_match
setopt no_null_glob
setopt numeric_glob_sort
setopt no_rc_expand_param
setopt no_rematch_pcre
setopt no_sh_glob
setopt no_unset
setopt warn_create_global
# }}}
# History {{{
export HISTFILE=${HOME}/.histfile
export HISTSIZE=1000
export SAVEHIST=1000
setopt append_history
setopt bang_hist
setopt extended_history
setopt hist_allow_clobber
setopt no_hist_beep
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_find_no_dups
setopt no_hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_lex_words
setopt no_hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_by_copy
setopt no_hist_save_no_dups
setopt hist_verify
setopt no_inc_append_history
setopt no_inc_append_history_time
setopt no_share_history
# }}}
# Initialisation {{{
setopt no_all_export
setopt no_global_export
setopt global_rcs
setopt rcs
# }}}
# Input/Output {{{
setopt aliases
setopt clobber
setopt no_correct
setopt no_correct_all
setopt no_dvorak
setopt flow_control
setopt no_ignore_eof
setopt interactive_comments
setopt hash_cmds
setopt hash_dirs
setopt no_hash_executables_only
setopt no_mail_warning
setopt path_dirs
setopt path_script
setopt print_exit_value
setopt no_rc_quotes
setopt rm_star_silent
setopt no_rm_star_wait
setopt short_loops
setopt no_sun_keyboard_hack
# }}}
# Job Control {{{
export REPORTTIME=1
TIMEFMT=$'%J\n%*E (user:%*U sys:%*S)'
TIMEFMT+=$'\ncpu %P\tmem %MKB (avg text:%XKB data:%DKB)'
TIMEFMT+=$'\nmajor fault %F\tminor fault %R\tswap %W'
TIMEFMT+=$'\ninput %I\toutput %O\tcontext switch %w'
export TIMEFMT
setopt auto_continue
setopt no_auto_resume
setopt bg_nice
setopt check_jobs
setopt no_hup
setopt long_list_jobs
setopt monitor
setopt no_notify
setopt posix_jobs
# }}}
# Prompting {{{
# Default prompt
export PS1="%m%#"
export PS2="%_>"
export PS3="?#"
export PS4="+"
export RPS1=""
export RPS2=""
setopt no_prompt_bang
setopt prompt_cr
setopt prompt_sp
setopt prompt_percent
setopt prompt_subst
setopt no_transient_rprompt
# }}}
# Scripts and Functions {{{
setopt c_bases
setopt c_precedences
setopt debug_before_cmd
setopt no_err_exit
setopt no_err_return
setopt eval_lineno
setopt no_function_argzero
setopt local_loops
setopt local_options
setopt local_patterns
setopt no_local_traps
setopt no_multi_func_def
setopt multios
setopt octal_zeroes
setopt pipe_fail
#setopt source_trace # useful for debug purposes
setopt no_typeset_silent
#setopt no_verbose
#setopt xtrace # useful for debug purposes
# }}}
# Shell Emulation {{{
setopt append_create
setopt no_bash_rematch
setopt bsd_echo
setopt no_continue_on_error
setopt no_csh_junkie_history
setopt no_csh_junkie_loops
setopt no_csh_junkie_quotes
setopt no_csh_nullcmd
setopt no_ksh_arrays
setopt no_ksh_autoload
setopt ksh_option_print
setopt no_ksh_typeset
setopt no_ksh_zero_subscript
setopt posix_aliases
setopt posix_argzero
setopt posix_builtins
#setopt posix_identifiers
setopt posix_strings
setopt posix_traps
setopt no_sh_file_expansion
setopt no_sh_nullcmd
setopt no_sh_option_letters
setopt no_sh_word_split
setopt no_traps_async
# }}}
# Zsh Line Editor {{{
bindkey -e
setopt no_beep
setopt combining_chars
setopt no_overstrike
setopt no_single_line_zle
bindkey "^[[3~" delete-char
# }}}


source ${HOME}/.zshrc_prompts
source ${HOME}/.zshrc_functions
source ${HOME}/.zshrc_aliases


autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
#[[ -n "${key[Up]-}" ]] && bindkey "${key[Up]}" up-line-or-beginning-search
#[[ -n "${key[Down]-}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle ':completion:*' completions 1
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=2
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'prout %e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true
zstyle :compinstall filename '/etc/zsh/zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

return 0

# vim:filetype=zsh:syntax=zsh
# vim:foldmethod=marker:foldlevel=0
