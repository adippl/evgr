# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="minio clustered object storage cli tool"
HOMEPAGE="https://min.io"

RELEASE="2024-07-31T15-58-33Z"

SRC_URI="
	amd64?   ( "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.RELEASE.${RELEASE}" -> ${PN}-amd64-${PVR} )
	arm64?   ( "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.RELEASE.${RELEASE}" -> ${PN}-arm64-${PVR} )
"

S="${WORKDIR}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""

#DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
#BDEPEND=""

src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/mc
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
	dobin mc
	}
