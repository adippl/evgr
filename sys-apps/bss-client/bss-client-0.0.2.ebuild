# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="client for btrfs incremental backup utility"
HOMEPAGE="https://github.com/adippl/bss"
S="${WORKDIR}"
LICENSE="GPL-2"
SLOT="0"
#SRC_URI=""

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
fi
KEYWORDS="amd64 arm64"

#inherit git-r3
#EGIT_REPO_URI="https://github.com/adippl/bss"

DEPEND="
	app-shells/bash:*
	virtual/ssh
	sys-fs/btrfs-progs
	acct-user/bss
	app-admin/doas
	"
RDEPEND="${DEPEND}"
#BDEPEND=""

src_prepare(){
	eapply_user
	true
}
src_configure(){
	true
}
src_compile(){
	true
}
src_install(){
	dodir /etc
	cp "${FILESDIR}/doas-${PVR}.conf" "${D}/etc/doas.conf"
}
