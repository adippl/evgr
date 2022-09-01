# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="system config files"
HOMEPAGE="https://github.com/adippl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=" amd64 arm64"

DEPEND=""

S="$WORKDIR"

#src_prepare() {
#	default
#}
#
src_install() {
	insinto /etc/bash/bashrc.d
	doins "$FILESDIR/bash-aliases.sh"
	insinto "/etc/vim/vimrc.local"
	doins "$FILESDIR/vimrc.local"
	insinto /etc/containers
	doins "$FILESDIR/registries.conf"
	doins "$FILESDIR/policy.json"
	doins "$FILESDIR/storage.conf"
}
