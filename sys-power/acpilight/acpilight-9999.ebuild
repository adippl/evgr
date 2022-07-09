# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Replacement for xbacklight that uses the ACPI to set brightness. C rewrite"

HOMEPAGE="https://github.com/adippl/acpilight"

if [[ ${PVR} != "9999" ]] ; then
	EGIT_COMMIT="${PVR}"
	KEYWORDS="amd64"
fi

inherit git-r3
inherit udev
#EGIT_REPO_URI="https://github.com/adippl/acpilight"
EGIT_REPO_URI="${HOMEPAGE}"
EGIT_BRANCH="c_rewrite"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="	virtual/udev
			acct-group/video
			!dev-libs/light
			!x11-apps/xbacklight"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install(){
	dobin xbacklight
	udev_dorules 90-backlight.rules
}

pkg_postinst() {
	udev_reload
	einfo
	elog "To use the xbacklight binary as a regular user, you must be a part of the video group"
	einfo
	elog "If this utility does not find any backlights to manipulate,"
	elog "verify you have kernel support on the device and display driver enabled."
	einfo
	elog "To take advantage of the OpenRC init script, and automate the process of"
	elog "saving and restoring the brightness level you should add acpilight"
	elog "to the boot runlevel. You can do this as root like so:"
	elog "# rc-update add acpilight boot"
	einfo
}
pkg_postrm() {
	# Triggers a QA warning if missing
	udev_reload
}
