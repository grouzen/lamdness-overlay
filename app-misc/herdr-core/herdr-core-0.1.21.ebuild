# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.96.1"
ZIG_SLOT="0.16"
ZIG_NEEDS_LLVM=1

CRATES="
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	bytes@1.12.1
	clap@4.6.7
	clap_builder@4.6.7
	clap_derive@4.6.7
	clap_lex@1.1.1
	colorchoice@1.0.5
	dyn-clone@1.0.20
	errno@0.3.14
	heck@0.5.0
	is_terminal_polyfill@1.70.2
	itoa@1.0.18
	libc@0.2.190
	memchr@2.8.3
	mio@1.2.4
	once_cell_polyfill@1.70.2
	pin-project-lite@0.2.17
	proc-macro2@1.0.107
	quote@1.0.47
	ref-cast-impl@1.0.27
	ref-cast@1.0.27
	schemars@1.2.2
	schemars_derive@1.2.2
	serde@1.0.229
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_derive_internals@0.30.0
	serde_json@1.0.154
	serde_spanned@1.1.2
	signal-hook-registry@1.4.8
	socket2@0.6.5
	strsim@0.11.1
	syn@3.0.8
	tokio-macros@2.7.2
	tokio@1.54.1
	toml@1.1.8+spec-1.1.0
	toml_datetime@1.1.2+spec-1.1.0
	toml_parser@1.1.5+spec-1.1.0
	unicode-ident@1.0.26
	utf8parse@0.2.2
	wasi@0.11.1+wasi-snapshot-preview1
	windows-link@0.2.1
	windows-sys@0.61.2
	winnow@1.0.4
	zmij@1.0.23
"

inherit cargo zig-utils

DESCRIPTION="Persistent terminals for coding agents"
HOMEPAGE="https://github.com/herdrdev/herdr-core"
GHOSTTY_COMMIT="1e5cdb865807abc990181efb8ebfa9122955cce2"
DEPS_URI="https://deps.files.ghostty.org"
FONTCONFIG_URI="https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.3"
SRC_URI="
	https://github.com/herdrdev/herdr-core/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ghostty-org/ghostty/archive/${GHOSTTY_COMMIT}.tar.gz -> ${P}-ghostty.tar.gz
	${DEPS_URI}/libxev-9ce8e8e6ff89e583258a7f8e7adeeeaeae8611bf.tar.gz
		-> ${P}-libxev-9ce8e8e6ff89e583258a7f8e7adeeeaeae8611bf.tar.gz
	${DEPS_URI}/vaxis-1dbbe575dff4586fe51e3217aa5c3fecdcbb6089.tar.gz
		-> ${P}-vaxis-1dbbe575dff4586fe51e3217aa5c3fecdcbb6089.tar.gz
	${DEPS_URI}/z2d-7dbae85c81784dba9988320bf9543ed9a81350c8.tar.gz
		-> ${P}-z2d-7dbae85c81784dba9988320bf9543ed9a81350c8.tar.gz
	${DEPS_URI}/zig_objc-c8de82ff80281215ad92900866dab7103a8efa8b.tar.gz
		-> ${P}-zig_objc-c8de82ff80281215ad92900866dab7103a8efa8b.tar.gz
	${DEPS_URI}/zig_js-3c23860e47fdcdc5af805efb7fd0bdac5fd3e9bc.tar.gz
		-> ${P}-zig_js-3c23860e47fdcdc5af805efb7fd0bdac5fd3e9bc.tar.gz
	https://github.com/jacobsandlund/uucode/archive/9d55524551411b493cca41ca06363625d90aff1e.tar.gz
		-> ${P}-9d55524551411b493cca41ca06363625d90aff1e.tar.gz
	${DEPS_URI}/wayland-0.6.0-lQa1kqz8AQADQmdNJsNhLoNHcnEGEUjrOaPV-dtEnEmX.tar.gz
		-> ${P}-wayland-0.6.0-lQa1kqz8AQADQmdNJsNhLoNHcnEGEUjrOaPV-dtEnEmX.tar.gz
	${DEPS_URI}/zf-c35c421f84895193246db06c40683c1a30e616ef.tar.gz
		-> ${P}-zf-c35c421f84895193246db06c40683c1a30e616ef.tar.gz
	${DEPS_URI}/gobject-2026-07-28-36-1.tar.zst -> ${P}-gobject-2026-07-28-36-1.tar.zst
	${DEPS_URI}/wayland-9cb3d7aa9dc995ffafdbdef7ab86a949d0fb0e7d.tar.gz
		-> ${P}-wayland-9cb3d7aa9dc995ffafdbdef7ab86a949d0fb0e7d.tar.gz
	${DEPS_URI}/N-V-__8AAFdWDwA0ktbNUi9pFBHCRN4weXIgIfCrVjfGxqgA.tar.gz
		-> ${P}-N-V-__8AAFdWDwA0ktbNUi9pFBHCRN4weXIgIfCrVjfGxqgA.tar.gz
	${DEPS_URI}/plasma_wayland_protocols-12207e0851c12acdeee0991e893e0132fc87bb763969a585dc16ecca33e88334c566.tar.gz
		-> ${P}-plasma_wayland_protocols-12207e0851c12acdeee0991e893e0132fc87bb763969a585dc16ecca33e88334c566.tar.gz
	${DEPS_URI}/JetBrainsMono-2.304.tar.gz -> ${P}-JetBrainsMono-2.304.tar.gz
	${DEPS_URI}/NerdFontsSymbolsOnly-3.4.0.tar.gz -> ${P}-NerdFontsSymbolsOnly-3.4.0.tar.gz
	${DEPS_URI}/ghostty-themes-release-20261005-151109-31756e7.tgz
		-> ${P}-ghostty-themes-release-20261005-151109-31756e7.tgz
	${DEPS_URI}/breakpad-b99f444ba5f6b98cac261cbb391d8766b34a5918.tar.gz
		-> ${P}-breakpad-b99f444ba5f6b98cac261cbb391d8766b34a5918.tar.gz
	${DEPS_URI}/DearBindings_v0.17_ImGui_v1.92.5-docking.tar.gz -> ${P}-DearBindings_v0.17_ImGui_v1.92.5-docking.tar.gz
	${DEPS_URI}/N-V-__8AAEbOfQBnvcFcCX2W5z7tDaN8vaNZGamEQtNOe0UI.tar.gz
		-> ${P}-N-V-__8AAEbOfQBnvcFcCX2W5z7tDaN8vaNZGamEQtNOe0UI.tar.gz
	https://gitlab.freedesktop.org/api/v4/projects/890/packages/generic/fontconfig/2.18.3/fontconfig-2.18.3.tar.xz
		-> ${P}-fontconfig-2.18.3.tar.xz
	${DEPS_URI}/freetype-1220b81f6ecfb3fd222f76cf9106fecfa6554ab07ec7fdc4124b9bb063ae2adf969d.tar.gz
		-> ${P}-freetype-1220b81f6ecfb3fd222f76cf9106fecfa6554ab07ec7fdc4124b9bb063ae2adf969d.tar.gz
	${DEPS_URI}/glslang-12201278a1a05c0ce0b6eb6026c65cd3e9247aa041b1c260324bf29cee559dd23ba1.tar.gz
		-> ${P}-glslang-12201278a1a05c0ce0b6eb6026c65cd3e9247aa041b1c260324bf29cee559dd23ba1.tar.gz
	${DEPS_URI}/gtk4-layer-shell-1.1.0.tar.gz -> ${P}-gtk4-layer-shell-1.1.0.tar.gz
	${DEPS_URI}/wayland-protocols-258d8f88f2c8c25a830c6316f87d23ce1a0f12d9.tar.gz
		-> ${P}-wayland-protocols-258d8f88f2c8c25a830c6316f87d23ce1a0f12d9.tar.gz
	${DEPS_URI}/harfbuzz-11.0.0.tar.xz -> ${P}-harfbuzz-11.0.0.tar.xz
	${DEPS_URI}/highway-66486a10623fa0d72fe91260f96c892e41aceb06.tar.gz
		-> ${P}-highway-66486a10623fa0d72fe91260f96c892e41aceb06.tar.gz
	${DEPS_URI}/gettext-0.24.tar.gz -> ${P}-gettext-0.24.tar.gz
	${DEPS_URI}/libpng-1220aa013f0c83da3fb64ea6d327f9173fa008d10e28bc9349eac3463457723b1c66.tar.gz
		-> ${P}-libpng-1220aa013f0c83da3fb64ea6d327f9173fa008d10e28bc9349eac3463457723b1c66.tar.gz
	${DEPS_URI}/libxml2-2.11.5.tar.gz -> ${P}-libxml2-2.11.5.tar.gz
	${DEPS_URI}/oniguruma-1220c15e72eadd0d9085a8af134904d9a0f5dfcbed5f606ad60edc60ebeccd9706bb.tar.gz
		-> ${P}-oniguruma-1220c15e72eadd0d9085a8af134904d9a0f5dfcbed5f606ad60edc60ebeccd9706bb.tar.gz
	${DEPS_URI}/sentry-1220446be831adcca918167647c06c7b825849fa3fba5f22da394667974537a9c77e.tar.gz
		-> ${P}-sentry-1220446be831adcca918167647c06c7b825849fa3fba5f22da394667974537a9c77e.tar.gz
	${DEPS_URI}/spirv_cross-1220fb3b5586e8be67bc3feb34cbe749cf42a60d628d2953632c2f8141302748c8da.tar.gz
		-> ${P}-spirv_cross-1220fb3b5586e8be67bc3feb34cbe749cf42a60d628d2953632c2f8141302748c8da.tar.gz
	https://codeberg.org/vancluever/translate-c/archive/4e879eb8aba615de112eabd1231ea6e01920cead.tar.gz
		-> ${P}-4e879eb8aba615de112eabd1231ea6e01920cead.tar.gz
	${DEPS_URI}/wuffs-7411f488fe2e2c205c3d3b3d28638b7356522930.tar.gz
		-> ${P}-wuffs-7411f488fe2e2c205c3d3b3d28638b7356522930.tar.gz
	${DEPS_URI}/pixels-12207ff340169c7d40c570b4b6a97db614fe47e0d83b5801a932dcd44917424c8806.tar.gz
		-> ${P}-pixels-12207ff340169c7d40c570b4b6a97db614fe47e0d83b5801a932dcd44917424c8806.tar.gz
	${DEPS_URI}/zlib-1220fed0c74e1019b3ee29edae2051788b080cd96e90d56836eea857b0b966742efb.tar.gz
		-> ${P}-zlib-1220fed0c74e1019b3ee29edae2051788b080cd96e90d56836eea857b0b966742efb.tar.gz
	https://github.com/zigimg/zigimg/archive/d695acd97c02e57bb151e8f659d1280f5cd6ca70.tar.gz
		-> ${P}-d695acd97c02e57bb151e8f659d1280f5cd6ca70.tar.gz
	https://github.com/vancluever/arocc/archive/f97cdfc3779aec4b242299e2fc9a1c828c3547c6.tar.gz
		-> ${P}-f97cdfc3779aec4b242299e2fc9a1c828c3547c6.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0 BSD FTL MIT MPL-2.0 OFL-1.1 Unicode-3.0 libpng"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	|| (
		=dev-lang/zig-0.16.0*[llvm(+)]
		=dev-lang/zig-bin-0.16.0*
	)
"

ZIG_DISTFILES=(
	"${P}-libxev-9ce8e8e6ff89e583258a7f8e7adeeeaeae8611bf.tar.gz"
	"${P}-vaxis-1dbbe575dff4586fe51e3217aa5c3fecdcbb6089.tar.gz"
	"${P}-z2d-7dbae85c81784dba9988320bf9543ed9a81350c8.tar.gz"
	"${P}-zig_objc-c8de82ff80281215ad92900866dab7103a8efa8b.tar.gz"
	"${P}-zig_js-3c23860e47fdcdc5af805efb7fd0bdac5fd3e9bc.tar.gz"
	"${P}-9d55524551411b493cca41ca06363625d90aff1e.tar.gz"
	"${P}-wayland-0.6.0-lQa1kqz8AQADQmdNJsNhLoNHcnEGEUjrOaPV-dtEnEmX.tar.gz"
	"${P}-zf-c35c421f84895193246db06c40683c1a30e616ef.tar.gz"
	"${P}-gobject-2026-07-28-36-1.tar.zst"
	"${P}-wayland-9cb3d7aa9dc995ffafdbdef7ab86a949d0fb0e7d.tar.gz"
	"${P}-N-V-__8AAFdWDwA0ktbNUi9pFBHCRN4weXIgIfCrVjfGxqgA.tar.gz"
	"${P}-plasma_wayland_protocols-12207e0851c12acdeee0991e893e0132fc87bb763969a585dc16ecca33e88334c566.tar.gz"
	"${P}-JetBrainsMono-2.304.tar.gz"
	"${P}-NerdFontsSymbolsOnly-3.4.0.tar.gz"
	"${P}-ghostty-themes-release-20261005-151109-31756e7.tgz"
	"${P}-breakpad-b99f444ba5f6b98cac261cbb391d8766b34a5918.tar.gz"
	"${P}-DearBindings_v0.17_ImGui_v1.92.5-docking.tar.gz"
	"${P}-N-V-__8AAEbOfQBnvcFcCX2W5z7tDaN8vaNZGamEQtNOe0UI.tar.gz"
	"${P}-fontconfig-2.18.3.tar.xz"
	"${P}-freetype-1220b81f6ecfb3fd222f76cf9106fecfa6554ab07ec7fdc4124b9bb063ae2adf969d.tar.gz"
	"${P}-glslang-12201278a1a05c0ce0b6eb6026c65cd3e9247aa041b1c260324bf29cee559dd23ba1.tar.gz"
	"${P}-gtk4-layer-shell-1.1.0.tar.gz"
	"${P}-wayland-protocols-258d8f88f2c8c25a830c6316f87d23ce1a0f12d9.tar.gz"
	"${P}-harfbuzz-11.0.0.tar.xz"
	"${P}-highway-66486a10623fa0d72fe91260f96c892e41aceb06.tar.gz"
	"${P}-gettext-0.24.tar.gz"
	"${P}-libpng-1220aa013f0c83da3fb64ea6d327f9173fa008d10e28bc9349eac3463457723b1c66.tar.gz"
	"${P}-libxml2-2.11.5.tar.gz"
	"${P}-oniguruma-1220c15e72eadd0d9085a8af134904d9a0f5dfcbed5f606ad60edc60ebeccd9706bb.tar.gz"
	"${P}-sentry-1220446be831adcca918167647c06c7b825849fa3fba5f22da394667974537a9c77e.tar.gz"
	"${P}-spirv_cross-1220fb3b5586e8be67bc3feb34cbe749cf42a60d628d2953632c2f8141302748c8da.tar.gz"
	"${P}-4e879eb8aba615de112eabd1231ea6e01920cead.tar.gz"
	"${P}-wuffs-7411f488fe2e2c205c3d3b3d28638b7356522930.tar.gz"
	"${P}-pixels-12207ff340169c7d40c570b4b6a97db614fe47e0d83b5801a932dcd44917424c8806.tar.gz"
	"${P}-zlib-1220fed0c74e1019b3ee29edae2051788b080cd96e90d56836eea857b0b966742efb.tar.gz"
	"${P}-d695acd97c02e57bb151e8f659d1280f5cd6ca70.tar.gz"
	"${P}-f97cdfc3779aec4b242299e2fc9a1c828c3547c6.tar.gz"
)

pkg_setup() {
	rust_pkg_setup
	zig-utils_setup
}

src_unpack() {
	cargo_src_unpack
	rmdir "${S}/vendor/ghostty" || die
	mv "${WORKDIR}/ghostty-${GHOSTTY_COMMIT}" "${S}/vendor/ghostty" || die
}

src_prepare() {
	default

	pushd vendor/ghostty >/dev/null || die
	local archive
	for archive in "${ZIG_DISTFILES[@]}"; do
		ZIG_GLOBAL_CACHE_DIR="${T}/zig-packages" \
			"${ZIG_EXE}" fetch --global-cache-dir "${T}/zig-packages" \
			"file://${DISTDIR}/${archive}" || die
	done
	popd >/dev/null || die
}

src_compile() {
	local -x ZIG="${ZIG_EXE}"
	local -x ZIG_GLOBAL_CACHE_DIR="${T}/zig-packages"
	local -x ZIG_LOCAL_CACHE_DIR="${T}/zig-local-cache"

	cargo_src_compile
}

src_test() {
	# The installer test hardcodes /usr/bin/sh, which Gentoo does not provide.
	local CARGO_SKIP_TESTS=( the_install_script_installs_when_the_temp_dir_cannot_execute )
	local -x ZIG="${ZIG_EXE}"
	local -x ZIG_GLOBAL_CACHE_DIR="${T}/zig-packages"
	local -x ZIG_LOCAL_CACHE_DIR="${T}/zig-local-cache"

	cargo_src_test
}

src_install() {
	dobin "$(cargo_target_dir)/herdr-core"
	dosym herdr-core /usr/bin/hc
}

QA_FLAGS_IGNORED="usr/bin/herdr-core"
