# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker systemd

DESCRIPTION="Get up and running with local large language models"
HOMEPAGE="https://ollama.com"
SRC_URI="
	amd64? (
		https://github.com/ollama/ollama/releases/download/v${PV}/ollama-linux-amd64.tar.zst
			-> ${PN}-amd64-${PV}.tar.zst
	)
	rocm? (
		https://github.com/ollama/ollama/releases/download/v${PV}/ollama-linux-amd64-rocm.tar.zst
			-> ${PN}-rocm-amd64-${PV}.tar.zst
	)
"
S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="cuda rocm"

RESTRICT="strip"

BDEPEND="
	dev-util/patchelf
"

RDEPEND="
	acct-group/ollama
	acct-group/render
	acct-group/video
	app-arch/bzip2
	app-arch/xz-utils
	app-arch/zstd
	media-libs/vulkan-loader
	sys-libs/zlib-ng
	>=acct-user/ollama-3[cuda?]
	cuda? (
		dev-util/nvidia-cuda-toolkit
	)
"

QA_PREBUILT="*"

src_prepare() {
	default
	if ! use cuda; then
		rm -rf "${S}"/lib/ollama/{cuda_v12,cuda_v13} || die
	fi

	# Upstream libraries ship a build-time RUNPATH. The installed libraries
	# only need to resolve siblings from the same directory.
	for so in "${S}"/lib/ollama/*.so; do
		patchelf --set-rpath '$ORIGIN' "${so}" || die
	done
}

src_install() {
	dodir /opt/ollama
	cp -a bin lib "${ED}"/opt/ollama/ || die "installing ollama blob failed"

	dosym ../../opt/ollama/bin/ollama /usr/bin/ollama
	dosym ../../opt/ollama/lib/ollama/llama-server /usr/bin/llama-server
	dosym ../../opt/ollama/lib/ollama/llama-quantize /usr/bin/llama-quantize

	newconfd "${FILESDIR}"/ollama.confd ollama
	newinitd "${FILESDIR}"/ollama.initd ollama
	systemd_dounit "${FILESDIR}"/ollama.service
}
