#!/usr/bin/env bash

<<<<<<< HEAD
_try_pyenv() {
	local pyenv='' name='' src=''
	if hash pyenv 2>/dev/null; then
		pyenv="$(pyenv root)"
		for name in "neovim" "neovim3" "nvim"; do
			src="${pyenv}/versions/${name}"
			if [ -d "${src}" ]; then
				echo "===> pyenv virtualenv found '${name}'"
				ln -fs "${src}" "${__venv}"
			fi
		done
	else
		echo ":: pyenv not found"
		return 1
	fi
}
||||||| fc3e398
# Declare a base path for both virtual environments
venv="${XDG_CACHE_HOME:-$HOME/.cache}/vim/venv"
=======
_try_pyenv() {
	local name='' src=''
	if hash pyenv 2>/dev/null; then
		echo '===> pyenv found, searching virtualenvs…'
		for name in 'neovim' 'neovim3' 'nvim'; do
			src="$(pyenv prefix "${name}" 2>/dev/null)"
			if [ -d "${src}" ]; then
				echo "===> pyenv virtualenv found '${name}', upgrading..."
				# Symlink virtualenv for easy access
				ln -fhs "${src}" "${__venv}"
				return 0
			fi
		done
		echo "===> skipping pyenv. manual virtualenv isn't found"
		echo
		echo "Press Ctrl+C and use pyenv to create one yourself (name it 'neovim')"
		echo "and run ${0} again. Or press Enter to continue and create a"
		echo "virtualenv using: python3 -m venv '${__venv}'"
		read -r
	else
		echo '===> pyenv not found, skipping'
	fi
	return 1
}
>>>>>>> 7c124cded3ee8153c5d1725f67a4a367c29d324b

<<<<<<< HEAD
_try_python() {
	if ! hash python3 2>/dev/null; then
		echo ':: python3 not found, consider installing pyenv.'
		return 1
	fi
	echo "===> python3 found"
	[ -d "${__venv}" ] || python3 -m venv "${__venv}"
}
||||||| fc3e398
# Try to detect python2/3 executables
if ! hash python2 2>/dev/null; then
	echo "Python2 installation not found."
	exit 1
elif ! hash python3 2>/dev/null; then
	echo "Python3 installation not found."
	exit 1
fi
=======
_try_python() {
	if ! hash python3 2>/dev/null; then
		echo '===> python3 not found, skipping'
		return 1
	fi
	echo "===> python3 found"
	[ -d "${__venv}" ] || python3 -m venv "${__venv}"
}
>>>>>>> 7c124cded3ee8153c5d1725f67a4a367c29d324b

<<<<<<< HEAD
main() {
	# Declare a base path for virtual environment
	local __venv="${XDG_CACHE_HOME:-$HOME/.cache}/vim/venv"
||||||| fc3e398
# Ensure python 2/3 virtual environments
[ -d "$venv" ] || mkdir -p "$venv"
if hash pyenv 2>/dev/null && [ -d "$(pyenv root)/versions/neovim2" ] && [ -d "$(pyenv root)/versions/neovim3" ]; then
	# pyenv environments are setup so use them
	[ -d "$venv/neovim2" ] || ln -s "$(pyenv root)/versions/neovim2" "$venv/neovim2"
	[ -d "$venv/neovim3" ] || ln -s "$(pyenv root)/versions/neovim3" "$venv/neovim3"
else
	[ -d "$venv/neovim2" ] || python2 -m virtualenv "$venv/neovim2"
	[ -d "$venv/neovim3" ] || python3 -m venv "$venv/neovim3"
fi
=======
main() {
	# Concat a base path for vim cache and virtual environment
	local __cache="${XDG_CACHE_HOME:-$HOME/.cache}/vim"
	local __venv="${__cache}/venv"
	mkdir -p "${__cache}"
>>>>>>> 7c124cded3ee8153c5d1725f67a4a367c29d324b

<<<<<<< HEAD
	if _try_pyenv || _try_python; then
		"${__venv}/bin/pip" install -U pynvim PyYAML Send2Trash
		echo
	else
		echo '===> ERROR: pyenv and python3 missing.'
	fi
}

main
||||||| fc3e398
# Install or upgrade dependencies
echo ':: PYTHON 2'
"$venv/neovim2/bin/pip" install -U pynvim PyYAML
echo -e '\n:: PYTHON 3'
"$venv/neovim3/bin/pip" install -U pynvim PyYAML Send2Trash
=======
	if [ -d "${__venv}/neovim2" ]; then
		echo -n '===> ERROR: Python 2 has ended its life, '
		echo ' only python3 virtualenv is created now.'
		echo "Delete '${__venv}' (or backup!) first, and then run ${0} again."
	elif _try_pyenv || _try_python; then
		# Install Python 3 requirements
		"${__venv}/bin/pip" install -U pynvim PyYAML Send2Trash
		echo '===> success'
	else
		echo '===> ERROR: Unable to setup python3 virtualenv.'
		echo -e '\nConsider using pyenv with its virtualenv plugin:'
		echo '- https://github.com/pyenv/pyenv'
		echo '- https://github.com/pyenv/pyenv-virtualenv'
	fi
}

main
>>>>>>> 7c124cded3ee8153c5d1725f67a4a367c29d324b
