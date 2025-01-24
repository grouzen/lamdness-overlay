# =============================================================================
#  File:    ${P}.ebuild
#  Path:    /usr/portage/${PN}
#  Source:  https://github.com/ollama/ollama.git
# =============================================================================

EAPI=8

inherit systemd

DESCRIPTION="Ollama is a command-line tool for managing and running private LLMs"
HOMEPAGE="https://github.com/ollama/ollama"

ROOT=/
SRC_URI="https://github.com/ollama/ollama/releases/download/v${PV}/ollama-linux-amd64.tgz -> ollama-linux-amd64-${PV}.tgz"
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
    mkdir -v "$WORKDIR/$P"
    tar xzpf "$DISTDIR/ollama-linux-amd64-${PV}.tgz" -C "$WORKDIR/$P"
}

src_install() {
    elog "installing"
    dobin bin/ollama
    dolib.so lib/ollama/lib*.so*
    newinitd "${FILESDIR}/ollama.initd" "ollama"
    newenvd "${FILESDIR}"/ollama.envd 99ollama
    systemd_dounit "${FILESDIR}/ollama.service"
}
