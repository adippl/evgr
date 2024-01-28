# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MODULES_OPTIONAL_IUSE="module"
inherit linux-mod-r1

DESCRIPTION="kernel modules for jool SIIT and NAT64 implementation"
HOMEPAGE="https://github.com/NICMx/Jool"

SRC_URI="https://github.com/NICMx/Jool/releases/download/v${PV}/jool-${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+module"
#IUSE="debug +module module-src"

CONFIG_CHECK="NET INET NET_UDP_TUNNEL CRYPTO_ALGAPI"

DEPEND="
	sys-kernel/dkms
	"


S="${WORKDIR}/jool-${PV}"

pkg_setup() {
	if use module; then
		linux-mod-r1_pkg_setup
		#if [[ -f $KERNEL_DIR/include/uapi/linux/wireguard.h ]]; then
		#	eerror
		#	eerror "WireGuard has been merged upstream into this kernel. Therefore,"
		#	eerror "you no longer need this compatibility ebuild. Instead, simply"
		#	eerror "enable CONFIG_WIREGUARD=y in your kernel configuration."
		#	eerror
		#	die "Use CONFIG_WIREGUARD=y for this kernel, and do not use this package."
		#elif kernel_is -lt 3 10 0 || kernel_is -ge 5 6 0; then
		#	die "This version of ${PN} requires Linux >= 3.10 and < 5.6."
		#fi
	fi
}

src_compile() {
	#local modlist=( wireguard=net:src::module )
	local modlist=( 
		jool
		jool_siit
		jool_common
		)
	local modargs=(
		KERNELDIR=${KV_OUT_DIR}
	)
	use debug && modargs+=( CONFIG_WIREGUARD_DEBUG=y )
	use module && linux-mod-r1_src_compile
}

src_install() {
	use module && linux-mod-r1_src_install
	use module-src && emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" -C src dkms-install
}

pkg_postinst() {
	if use module-src && ! use module; then
		einfo
		einfo "You have enabled the module-src USE flag without the module USE"
		einfo "flag. This means that sources are installed to"
		einfo "${ROOT}/usr/src/wireguard instead of having the"
		einfo "kernel module compiled. You will need to compile the module"
		einfo "yourself. Most likely, you don't want this USE flag, and should"
		einfo "rather use USE=module"
		einfo
	fi

	if use module; then
		linux-mod-r1_pkg_postinst
		#local old new
		#if [[ $(uname -r) != "${KV_FULL}" ]]; then
		#	ewarn
		#	ewarn "You have just built WireGuard for kernel ${KV_FULL}, yet the currently running"
		#	ewarn "kernel is $(uname -r). If you intend to use this WireGuard module on the currently"
		#	ewarn "running machine, you will first need to reboot it into the kernel ${KV_FULL}, for"
		#	ewarn "which this module was built."
		#	ewarn
		#elif [[ -f /sys/module/wireguard/version ]] && \
		#     old="$(< /sys/module/wireguard/version)" && \
		#     new="$(modinfo -F version "${ROOT}/lib/modules/${KV_FULL}/net/wireguard.ko" 2>/dev/null)" && \
		#     [[ $old != "$new" ]]; then
		#	ewarn
		#	ewarn "You appear to have just upgraded WireGuard from version v$old to v$new."
		#	ewarn "However, the old version is still running on your system. In order to use the"
		#	ewarn "new version, you will need to remove the old module and load the new one. As"
		#	ewarn "root, you can accomplish this with the following commands:"
		#	ewarn
		#	ewarn "    # rmmod wireguard"
		#	ewarn "    # modprobe wireguard"
		#	ewarn
		#	ewarn "Do note that doing this will remove current WireGuard interfaces, so you may want"
		#	ewarn "to gracefully remove them yourself prior."
		#	ewarn
		#fi
	fi
}
