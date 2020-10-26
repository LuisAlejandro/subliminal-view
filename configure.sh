#!/usr/bin/env bash
#   This file is part of Mash
#   Copyright (c) 2016-2020, Mash Developers
#
#   Please refer to CONTRIBUTORS.md for a complete list of Copyright
#   holders.
#
#   Mash is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Mash is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program. If not, see <http://www.gnu.org/licenses/>.

set -ex

function echospaced() {
    printf "\n# %s\n" "${1}"
}

echospaced "Creating folders ..."
mkdir -vp "${HOME}/.config/mash/recovery"
mkdir -vp "${HOME}/.config/mash/backups"
mkdir -vp "${HOME}/.config/mash/undo"
mkdir -vp "${HOME}/.config/mash/bin"
mkdir -vp "${HOME}/.config/mash/urxvt"
mkdir -vp "${HOME}/.config/mash/runtime"
mkdir -vp "${HOME}/.config/mash/plugins"
mkdir -vp "${HOME}/.config/mash/plug"
mkdir -vp "${HOME}/.config/mash/app"

echospaced "Updating font cache ..."
fc-cache -vr "${HOME}/.local/share/fonts"

echospaced "Configuring executables ..."
if [ ! -f "${HOME}/.bashrc" ]; then
    touch "${HOME}/.bashrc"
fi

if ! grep -q 'PATH="${PATH}:${HOME}/.local/bin"' "${HOME}/.bashrc"; then
    echo 'PATH="${PATH}:${HOME}/.local/bin"' >> "${HOME}/.bashrc"
fi