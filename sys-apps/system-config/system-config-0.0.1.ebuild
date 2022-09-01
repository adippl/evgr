# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="system config files"
HOMEPAGE="https://github.com/adippl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=" ~amd64 ~arm64"

DEPEND=""

src_prepare() {
	default
}

src_install() {
	cp "$FILES/bash-aliases.sh"		"${D}/etc/bash/bashrc.d/bash-aliases.sh"
	cp "$FILES/vimrc.local"			"${D}/etc/vim/vimrc.local"
	insinto /lib/firmware
	doins "$FILES/registries.conf"
	doins "$FILES/policy.json"
	doins "$FILES/storage.conf"
}
