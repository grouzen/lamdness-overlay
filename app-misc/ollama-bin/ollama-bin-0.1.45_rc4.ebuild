# =============================================================================
#  File:    ${P}.ebuild
#  Path:    /usr/portage/${PN}
#  Source:  https://github.com/ollama/ollama.git
# =============================================================================

EAPI=8

inherit systemd

MY_PV="0.1.45-rc4"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Ollama is a command-line tool for managing and running private LLMs"
HOMEPAGE="https://github.com/ollama/ollama"

ROOT=/
SRC_URI="https://github.com/ollama/ollama/releases/download/v${MY_PV}/ollama-linux-amd64 -> ollama-linux-amd64-${MY_PV}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
        acct-user/ollama
        acct-group/ollama
        "

RDEPEND="${DEPEND}"

src_unpack() {
    elog "copying binary"
    install -D -m 755 -v "$DISTDIR/ollama-linux-amd64-${PV}" "$WORKDIR/$P/ollama-linux-amd64"
}

src_install() {
    elog "installing"
    newbin "ollama-linux-amd64" "ollama"
    newinitd "${FILESDIR}/ollama.initd" "ollama"
    systemd_dounit "${FILESDIR}/ollama.service"
}
