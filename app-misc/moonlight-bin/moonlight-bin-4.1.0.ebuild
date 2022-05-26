# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="moonlight nvidia game streaming client (appimage)"
HOMEPAGE="https://moonlight-stream.org/"
SRC_URI="https://github.com/moonlight-stream/moonlight-qt/releases/download/v${PV}/Moonlight-${PV}-x86_64.AppImage"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sys-fs/fuse:0
	x11-libs/libva
	"
RDEPEND="${DEPEND}"
BDEPEND=""

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

S="${WORKDIR}"
src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/moonlight
	}
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
	dobin moonlight
	}
