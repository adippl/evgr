# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit udev
DESCRIPTION="udev rules enabling discard on JMicron 583 usd nvme adapter"
HOMEPAGE="https://github.com/adippl"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"
src_unpack(){
	true
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
	dobin "${FILESDIR}/udev_delayed_unmap.sh"
	udev_dorules "${FILESDIR}/jmicron-usb-nvme-adapter-discard.rules"
	}
pkg_postinst(){
	udev_reload
}
pkg_postrm(){
	udev_reload
}
