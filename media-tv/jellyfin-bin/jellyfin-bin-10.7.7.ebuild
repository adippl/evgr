# Copyright 2011-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="jellyfin binary package"
#HOMEPAGE="https://github.com/adippl/openrc-tmux-rtorrent"
HOMEPAGE="https://jellyfin.org/"
#SRC_URI="https://repo.jellyfin.org/releases/server/linux/stable/combined/jellyfin_10.7.7_amd64.tar.gz"
SRC_URI="
	amd64?	( https://repo.jellyfin.org/releases/server/linux/stable/combined/jellyfin_10.7.7_amd64.tar.gz )
	arm64?	( https://repo.jellyfin.org/releases/server/linux/stable/combined/jellyfin_10.7.7_arm64.tar.gz )
	arm?	( https://repo.jellyfin.org/releases/server/linux/stable/combined/jellyfin_10.7.7_armhf.tar.gz )
	"

inherit git-r3
EGIT_REPO_URI="git://git.home.lab/gentoo-openrc-jellyfin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
	sys-devel/gcc:*
	sys-libs/glibc
	media-video/ffmpeg[encode,openh264,twolame,vaapi,x264,x265,jpeg2k,bluray,vpx]
	"
RDEPEND="${DEPEND}"
BDEPEND="
	"
S="${WORKDIR}/jellyfin_10.7.7"
src_unpack(){
	default
	git-r3_src_unpack
}
src_install(){
	#mkdir ${D}/opt/jellyfin-bin
	dodir /opt/jellyfin-bin
	cp -r "${S}/*" "${D}/opt/jellyfin-bin/"
#	dosym /opt/jellyfin-bin/jellyfin /usr/bin/jellyfin
	dodir /etc/init.d/
	dodir /etc/conf.d/
	cp "${WORKDIR}/${P}/jellyfin" "${D}/etc/init.d/jellyfin"
	cp "${WORKDIR}/${P}/jellyfin_config" "${D}/etc/conf.d/jellyfin"
	die
}
