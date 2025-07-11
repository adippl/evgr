# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.15.0

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.98
	autocfg@1.4.0
	backoff@0.4.0
	backtrace@0.3.74
	bitflags@2.9.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	clap-num@1.2.0
	clap@4.5.37
	clap_builder@4.5.37
	clap_derive@4.5.32
	clap_lex@0.7.4
	clap_mangen@0.2.26
	colorchoice@1.0.3
	colored@2.2.0
	const_fn@0.4.11
	ctrlc@3.4.6
	either@1.15.0
	errno@0.3.11
	fastrand@2.3.0
	float-cmp@0.10.0
	getrandom@0.2.16
	gimli@0.31.1
	heck@0.5.0
	humantime@2.2.0
	instant@0.1.13
	is_terminal_polyfill@1.70.1
	itertools@0.14.0
	lazy_static@1.5.0
	libc@0.2.172
	linux-raw-sys@0.9.4
	lock_api@0.4.12
	log@0.4.27
	memchr@2.7.4
	miniz_oxide@0.8.8
	nix@0.29.0
	nix@0.30.0
	num-traits@0.2.19
	object@0.36.7
	once_cell@1.21.3
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	ppv-lite86@0.2.21
	proc-macro2@1.0.95
	quote@1.0.40
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.5.11
	roff@0.2.2
	rustc-demangle@0.1.24
	rustix@1.0.7
	rustversion@1.0.20
	scc@2.3.4
	scopeguard@1.2.0
	sdd@3.0.8
	serial_test@3.2.0
	serial_test_derive@3.2.0
	simple_logger@5.0.0
	smallvec@1.15.0
	strsim@0.11.1
	strum@0.27.1
	strum_macros@0.27.1
	syn@2.0.101
	tempfile@3.19.1
	thiserror-impl@2.0.12
	thiserror@2.0.12
	typed_floats@1.0.5
	typed_floats_macros@1.0.5
	unicode-ident@1.0.18
	utf8parse@0.2.2
	wasi@0.11.0+wasi-snapshot-preview1
	windows-sys@0.48.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	zerocopy-derive@0.8.25
	zerocopy@0.8.25
"

inherit cargo

DESCRIPTION="Daemon to regulate fan speed according to hard drive temperature on Linux"
HOMEPAGE=""
SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/desbma/hddfancontrol/archive/refs/tags/2.0.3.tar.gz -> ${PN}-${PVR}.tar.gz
"

BDEPEND="
	>=dev-lang/rust-common-1.86
	"


LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD MIT MPL-2.0 Unicode-3.0"
SLOT="0"
KEYWORDS="amd64 arm64"

src_install(){
	#cargo_src_install
	dobin ${WORKDIR}/${PN}-${PVR}/target/release/${PN}
	newinitd "${FILESDIR}/${PN}_initd" ${PN}
}
