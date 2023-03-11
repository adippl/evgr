# Copyright 2011-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="openrc script launching rtorrent in tmux, firejail and VPN network namespace"
HOMEPAGE="https://github.com/adippl/openrc-tmux-rtorrent"

if [[ ${PVR} = "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="$HOMEPAGE"
	#EGIT_COMMIT="${PVR}"
else
	SRC_URI="https://github.com/adippl/openrc-tmux-rtorrent/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 ~arm64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+wg"

DEPEND="
	sys-apps/openrc
	app-misc/tmux
	net-p2p/rtorrent
	net-misc/curl[adns]
	sys-apps/firejail
	wg? (
		sys-apps/iproute2
		net-vpn/wireguard-tools
		)
	"

DOCS=(
	README
	tmux-rtorrent.example
	)
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/make
	"
