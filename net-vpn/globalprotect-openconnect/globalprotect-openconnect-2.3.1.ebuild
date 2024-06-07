# =============================================================================
#  File:    ${P}.ebuild
#  Path:    /usr/portage/${PN}
#  Source:  https://github.com/yuezk/GlobalProtect-openconnect
# =============================================================================

EAPI=8

inherit xdg-utils

DESCRIPTION="GlobalProtect VPN GUI based on Openconnect with SAML auth mode support"
HOMEPAGE="https://github.com/yuezk/GlobalProtect-openconnect"
SRC_URI="https://github.com/yuezk/GlobalProtect-openconnect/releases/download/v${PV}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnome kde"
REQUIRED_USE="^^ ( gnome kde )"
RESTRICT="network-sandbox"

DEPEND="
	virtual/rust
	dev-lang/perl
	sys-auth/polkit
	net-vpn/openconnect
	net-libs/webkit-gtk:4
	dev-libs/libappindicator
	net-misc/curl
	net-misc/wget
	gnome? ( gnome-base/gnome-keyring )
	kde? ( kde-plasma/kwallet-pam )
"
RDEPEND="${DEPEND}"

src_compile() {
	make build BUILD_FE=0
}

src_install() {
	cd "${WORKDIR}/${P}"
	emake DESTDIR="${D}" install
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
