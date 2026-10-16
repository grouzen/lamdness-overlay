# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg-utils

DESCRIPTION="GlobalProtect VPN GUI based on OpenConnect with SAML authentication"
HOMEPAGE="https://github.com/yuezk/GlobalProtect-openconnect"
SRC_URI="https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v${PV}/${PN}_${PV}_x86_64.bin.tar.xz -> ${P}-amd64.bin.tar.xz"
S="${WORKDIR}/${PN}_${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnome kde"
RESTRICT="strip"

RDEPEND="
	app-arch/lz4
	app-arch/xz-utils
	app-crypt/p11-kit
	dev-libs/gmp
	dev-libs/glib:2
	dev-libs/nettle
	dev-libs/openssl:0=
	gnome? ( gnome-base/gnome-keyring )
	kde? ( kde-plasma/kwallet-pam )
	net-libs/gnutls
	net-libs/libsoup:3.0
	net-libs/webkit-gtk:4.1
	sys-apps/dbus
	sys-apps/iproute2
	sys-auth/polkit
	virtual/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3
"

QA_PREBUILT="usr/bin/*"

src_compile() {
	:
}

src_install() {
	emake DESTDIR="${ED}" install
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
