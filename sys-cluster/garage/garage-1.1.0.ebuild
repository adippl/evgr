# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="garage distributed storage"
HOMEPAGE="https://garagehq.deuxfleurs.fr"

SRC_URI="
	amd64?   ( "https://garagehq.deuxfleurs.fr/_releases/v${PV}/x86_64-unknown-linux-musl/garage"       -> ${PN}-amd64-${PVR} )
	x86?     ( "https://garagehq.deuxfleurs.fr/_releases/v${PV}/i686-unknown-linux-musl/garage"         -> ${PN}-x86${PVR} )
	arm64?   ( "https://garagehq.deuxfleurs.fr/_releases/v${PV}/aarch64-unknown-linux-musl/garage"      -> ${PN}-arm64-${PVR} )
	arm?     ( "https://garagehq.deuxfleurs.fr/_releases/v${PV}/armv6l-unknown-linux-musleabihf/garage" -> ${PN}-arm-${PVR} )
"

S="${WORKDIR}"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~arm64 ~amd"

#DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
#BDEPEND=""

src_unpack(){
	cp "${DISTDIR}"/${A} "${S}"/garage
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
	dobin garage
	newinitd "${FILESDIR}/garage_initd" garage
	#newconfd "${FILESDIR}/garage_confd" garage
	}
