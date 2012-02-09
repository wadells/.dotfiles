# git completion is painfully slow in large repos
# I've had my shell hang for several minutes.
# This fixes it!
#
# Credit: http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
	    _wanted files expl 'local files' _files
}
