# =============================================================================
#  File:    ${P}.ebuild
#  Path:    /usr/portage/${PN}
#  Source:  https://github.com/TheR1D/shell_gpt
# =============================================================================

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{6..13} )

inherit distutils-r1

DESCRIPTION="A command-line productivity tool powered by large language models, will help you accomplish your tasks faster and more efficiently"
HOMEPAGE="https://github.com/TheR1D/shell_gpt"
SRC_URI="https://github.com/TheR1D/shell_gpt/releases/download/${PV}/shell_gpt-${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
RESTRICT="mirror"

DOCS="README.md"

BDEPEND="dev-python/hatchling[${PYTHON_USEDEP}]"
# TODO: 
# - add litellm dep: https://github.com/BerriAI/litellm/blob/main/pyproject.toml
RDEPEND="
    dev-python/rich[${PYTHON_USEDEP}]
    dev-python/distro[${PYTHON_USEDEP}]
    dev-python/click[${PYTHON_USEDEP}]
    || ( HomeAssistantRepository/typer[${PYTHON_USEDEP}] )
"

src_unpack() {
    elog "unpacking"
    tar xfv "$DISTDIR/${P}.gh.tar.gz" -C "$WORKDIR"
    mv -v "$WORKDIR/shell_gpt-${PV}" "$WORKDIR/shell-gpt-${PV}"
}