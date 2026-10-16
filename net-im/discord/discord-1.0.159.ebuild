# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin/}"
MY_PV="${PV/-r*/}"

CHROMIUM_LANGS="
	af am ar bg bn ca cs da de el en-GB en-US es es-419 et fa fi fil fr gu he hi
	hr hu id it ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv
	sw ta te th tr uk ur vi zh-CN zh-TW
"

inherit chromium-2 desktop linux-info optfeature unpacker xdg

DESCRIPTION="All-in-one voice and text chat for gamers"
HOMEPAGE="https://discord.com/"
DISTRO_BASE="https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${PV}"
SRC_URI="
	https://dl.discordapp.net/apps/linux/${MY_PV}/${MY_PN}-${MY_PV}.tar.gz
	${DISTRO_BASE}/full.distro -> ${P}-full.distro
	${DISTRO_BASE}/discord_sysimg/1/full.distro -> ${P}-discord_sysimg.distro
	${DISTRO_BASE}/discord_krisp/1/full.distro -> ${P}-discord_krisp.distro
	${DISTRO_BASE}/discord_game_utils/1/full.distro -> ${P}-discord_game_utils.distro
	${DISTRO_BASE}/discord_desktop_core/1/full.distro -> ${P}-discord_desktop_core.distro
	${DISTRO_BASE}/discord_zstd/1/full.distro -> ${P}-discord_zstd.distro
	${DISTRO_BASE}/discord_rpc/1/full.distro -> ${P}-discord_rpc.distro
	${DISTRO_BASE}/discord_utils/1/full.distro -> ${P}-discord_utils.distro
	${DISTRO_BASE}/discord_dispatch/1/full.distro -> ${P}-discord_dispatch.distro
	${DISTRO_BASE}/discord_erlpack/1/full.distro -> ${P}-discord_erlpack.distro
	${DISTRO_BASE}/discord_modules/1/full.distro -> ${P}-discord_modules.distro
	${DISTRO_BASE}/discord_spellcheck/1/full.distro -> ${P}-discord_spellcheck.distro
"
S="${WORKDIR}/${MY_PN^}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="amd64"

IUSE="appindicator +seccomp wayland"
RESTRICT="bindist mirror strip test"

BDEPEND="
	app-arch/brotli
	app-misc/jq
"

DISCORD_MODULES=(
	discord_sysimg
	discord_krisp
	discord_game_utils
	discord_desktop_core
	discord_zstd
	discord_rpc
	discord_utils
	discord_dispatch
	discord_erlpack
	discord_modules
	discord_spellcheck
)

RDEPEND="
	>=app-accessibility/at-spi2-core-2.46.0:2
	dev-libs/expat
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/mesa[gbm(+)]
	net-print/cups
	sys-apps/dbus
	sys-apps/util-linux
	sys-libs/glibc
	x11-libs/cairo
	x11-libs/libdrm
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/libXScrnSaver
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXrandr
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libxshmfence
	x11-libs/pango
	appindicator? ( dev-libs/libayatana-appindicator )
"

DESTDIR="/opt/${MY_PN}"

QA_PREBUILT="*"

CONFIG_CHECK="~USER_NS"

src_unpack() {
	unpack "${MY_PN}-${MY_PV}.tar.gz"
	tar --use-compress-program=brotli -xf "${DISTDIR}/${P}-full.distro" \
		-C "${S}" --strip-components=1 || die "unpacking the main Discord distribution failed"

	local module
	for module in "${DISCORD_MODULES[@]}"; do
		mkdir -p "${S}/modules/${module}" || die
		tar --use-compress-program=brotli -xf "${DISTDIR}/${P}-${module}.distro" \
			-C "${S}/modules/${module}" --strip-components=1 ||
			die "unpacking ${module} failed"
	done
}

src_configure() {
	default
	chromium_suid_sandbox_check_kernel_config
}

src_prepare() {
	default
	# remove post-install script
	rm postinst.sh discord updater_bootstrap || die "removing bootstrap files failed"
	jq --arg modules "${DESTDIR}/modules" \
		'.newUpdater = false | .localModulesRoot = $modules' \
		resources/build_info.json > "${T}/build_info.json" || die
	mv "${T}/build_info.json" resources/build_info.json || die
	# cleanup languages
	pushd "locales/" >/dev/null || die "location change for language cleanup failed"
	chromium_remove_language_paks
	popd >/dev/null || die "location reset for language cleanup failed"

	# fix .desktop exec location
	sed --in-place --expression "/^Exec=/s:/usr/share/discord/Discord:/usr/bin/${MY_PN}:" \
		"${MY_PN}.desktop" ||
		die "fixing of exec location on .desktop failed"

	# Update exec location in launcher
	sed --expression "s:@@DESTDIR@@:${DESTDIR}:" \
		"${FILESDIR}/launcher.sh" > "${T}/launcher.sh" || die "updating of exec location in launcher failed"

	# USE seccomp in launcher
	if use seccomp; then
		sed --in-place --expression '/^EBUILD_SECCOMP=/s/false/true/' \
			"${T}/launcher.sh" || die "sed failed for seccomp"
	fi

	# USE wayland in launcher
	if use wayland; then
		sed --in-place --expression '/^EBUILD_WAYLAND=/s/false/true/' \
			"${T}/launcher.sh" || die "sed failed for wayland"
	fi
}

src_install() {
	doicon -s 256 "${MY_PN}.png"

	# install .desktop file
	domenu "${MY_PN}.desktop"

	mkdir -p "${ED}${DESTDIR}" || die
	cp -R "${S}/." "${ED}${DESTDIR}/" || die "installing Discord files failed"

	# Chrome-sandbox requires the setuid bit to be specifically set.
	# see https://github.com/electron/electron/issues/17972
	fowners root "${DESTDIR}/chrome-sandbox"
	fperms 4711 "${DESTDIR}/chrome-sandbox"

	exeinto "/usr/bin"
	newexe "${T}/launcher.sh" "discord" || die "failing to install launcher"

	# https://bugs.gentoo.org/898912
	if use appindicator; then
		dosym ../../usr/lib64/libayatana-appindicator3.so /opt/discord/libappindicator3.so
	fi
}

pkg_postinst() {
	xdg_pkg_postinst

	optfeature_header "Install the following packages for additional support:"
	optfeature "sound support" \
		media-sound/pulseaudio media-sound/apulse[sdk] media-video/pipewire
	optfeature "emoji support" media-fonts/noto-emoji
}
