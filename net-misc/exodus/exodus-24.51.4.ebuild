# NOTE: they blocked unofficial installation methods: https://github.com/flathub/io.exodus.Exodus/issues/183
# In order to install it you need to download the archive manually and place it in /var/cache/distfiles/ 

EAPI=8

DESCRIPTION="Exodus cryptocurrency wallet"
HOMEPAGE="https://www.exodus.com/"
SRC_URI=""

LICENSE="all-rights-reserved no-source-code"
SLOT="0"
KEYWORDS="~amd64"

# https://devmanual.gentoo.org/eclass-reference/ebuild/index.html
# Useful sanity check when installing files manually
QA_PREBUILT="*"
RESTRICT="fetch"

DESTDIR="/opt/${PN}"
# TODO: use variables instead of hardcoded path
DISTFILES="/var/cache/distfiles"
ARCHIVE="${DISTFILES}/${P}.zip"

pkg_nofetch() {
	einfo "This package requires you to manually download the ZIP archive from the official site via web browser"
	einfo "For more details see https://github.com/flathub/io.exodus.Exodus/issues/183"
}

pkg_pretend() {
	einfo "Checking if the archive is downloaded and placed into distfiles dir"

	if [[ -f "${ARCHIVE}" ]]; then
		einfo "Downloaded file was found"
	else
		die "Please download the archive manually from https://downloads.exodus.com/releases/exodus-linux-x64-${PV}.zip, rename it to ${P}.zip, and place it into your DISTDIR directory"
	fi
}

src_unpack() {
	UNZIPPED="Exodus-linux-x64"

	unzip "${ARCHIVE}" -d "${WORKDIR}/${UNZIPPED}"
 	mv -v "${WORKDIR}/${UNZIPPED}"/* "${S}"
}

src_install() {
	einfo "Installing by copying all the files ${S} -> ${D}/opt/${PN}"
	D_OPT_PN="${D}/opt/${PN}"
	mkdir -vp "${D_OPT_PN}"
	cp -arv "${S}"/* "${D_OPT_PN}"
}
