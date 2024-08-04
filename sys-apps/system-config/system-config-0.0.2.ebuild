# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="system config files"
HOMEPAGE="https://github.com/adippl"
S="$WORKDIR"

LICENSE="GPL-2"
SLOT="0"

src_install() {
	insinto /etc/bash/bashrc.d
	doins "$FILESDIR/bash-aliases.sh"
	insinto "/etc/vim/"
	doins "$FILESDIR/vimrc.local"
	insinto /etc/containers
	doins "$FILESDIR/registries.conf"
	doins "$FILESDIR/policy.json"
	doins "$FILESDIR/storage.conf"
}
