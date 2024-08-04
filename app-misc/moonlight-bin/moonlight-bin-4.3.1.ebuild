# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="moonlight nvidia game streaming client (appimage)"
HOMEPAGE="https://moonlight-stream.org/"
SRC_URI="https://github.com/moonlight-stream/moonlight-qt/releases/download/v${PV}/Moonlight-${PV}-x86_64.AppImage"

S="${WORKDIR}"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	sys-fs/fuse:0
	media-libs/libva
	"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
#BDEPEND=""

src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/moonlight-bin
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
	dobin moonlight-bin
	}
