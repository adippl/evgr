# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE="https://github.com/jurashka/dracut-ceph-module"
DESCRIPTION="boot"
#SRC_URI="https://codeload.github.com/amanusk/s-tui/tar.gz/refs/tags/v${PV} -> ${P}.tar.gz"

inherit git-r3
EGIT_REPO_URI="$HOMEPAGE"

#if [[ ${PVR} = "9999" ]] ; then
#	EGIT_SUBMODULES=()
#	EGIT_COMMIT="v${PVR}"
#fi

KEYWORDS="amd64"

RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

#	sys-cluster/ceph
DEPEND="
	sys-kernel/dracut
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	dodoc README.md
	dodir /usr/lib/dracut/modules.d
	mv ${S}/usr/lib/dracut/modules.d/95ceph ${D}/usr/lib/dracut/modules.d
	mv ${S}/usr/lib/dracut/modules.d/95http ${D}/usr/lib/dracut/modules.d
	mv ${S}/usr/lib/dracut/modules.d/95rbd ${D}/usr/lib/dracut/modules.d
}
