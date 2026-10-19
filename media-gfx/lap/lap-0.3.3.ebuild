# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER="1.88.0"

CRATES="
	adler2@2.0.1
	ahash@0.8.12
	aho-corasick@1.1.4
	aligned-vec@0.6.4
	aligned@0.4.3
	alloc-no-stdlib@2.0.4
	alloc-stdlib@0.2.2
	allocator-api2@0.2.21
	android_system_properties@0.1.5
	anndists@0.1.5
	anstream@1.0.0
	anstyle-parse@1.0.0
	anstyle-query@1.1.5
	anstyle-wincon@3.0.11
	anstyle@1.0.14
	anyhow@1.0.102
	arbitrary@1.4.2
	arboard@3.6.1
	arg_enum_proc_macro@0.3.4
	arrayref@0.3.9
	arrayvec@0.7.6
	as-slice@0.2.1
	atk-sys@0.18.2
	atk@0.18.2
	atomic-waker@1.1.2
	autocfg@1.5.0
	av-scenechange@0.14.1
	av1-grain@0.2.5
	avif-serialize@0.8.8
	base64@0.13.1
	base64@0.21.7
	base64@0.22.1
	base64ct@1.8.3
	bincode@1.3.3
	bit-set@0.8.0
	bit-vec@0.8.0
	bit_field@0.10.3
	bitflags@1.3.2
	bitflags@2.11.0
	bitstream-io@4.9.0
	blake3@1.8.3
	block-buffer@0.10.4
	block2@0.6.2
	brotli-decompressor@5.0.0
	brotli@8.0.2
	bstr@1.12.1
	built@0.8.0
	bumpalo@3.20.2
	bytemuck@1.25.0
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@1.11.1
	cairo-rs@0.18.5
	cairo-sys-rs@0.18.2
	camino@1.2.2
	cargo-platform@0.1.9
	cargo_metadata@0.19.2
	cargo_toml@0.22.3
	cc@1.2.58
	cesu8@1.1.0
	cfb@0.7.3
	cfg-expr@0.15.8
	cfg-if@1.0.4
	cfg_aliases@0.2.1
	chrono@0.4.44
	clipboard-win@5.4.1
	color_quant@1.1.0
	colorchoice@1.0.5
	combine@4.6.7
	constant_time_eq@0.4.2
	convert_case@0.4.0
	cookie@0.18.1
	core-foundation-sys@0.8.7
	core-foundation@0.10.1
	core-foundation@0.9.4
	core-graphics-types@0.2.0
	core-graphics@0.24.0
	core-graphics@0.25.0
	core2@0.4.0
	cpu-time@1.0.0
	cpufeatures@0.2.17
	crc-catalog@2.4.0
	crc32fast@1.5.0
	crc@3.4.0
	crossbeam-channel@0.5.15
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	crypto-common@0.1.7
	cssparser-macros@0.6.1
	cssparser@0.29.6
	cssparser@0.36.0
	csv-core@0.1.13
	csv@1.4.0
	ctor@0.2.9
	darling@0.20.11
	darling@0.23.0
	darling_core@0.20.11
	darling_core@0.23.0
	darling_macro@0.20.11
	darling_macro@0.23.0
	dbus@0.9.10
	defmt-macros@1.1.1
	defmt-parser@1.0.0
	defmt@1.1.1
	der@0.8.0
	deranged@0.5.8
	derive_arbitrary@1.4.2
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	derive_more-impl@2.1.1
	derive_more@0.99.20
	derive_more@2.1.1
	digest@0.10.7
	dirs-sys@0.4.1
	dirs-sys@0.5.0
	dirs@5.0.1
	dirs@6.0.0
	dispatch2@0.3.1
	displaydoc@0.2.5
	dlopen2@0.8.2
	dlopen2_derive@0.4.3
	document-features@0.2.12
	dom_query@0.27.0
	dpi@0.1.2
	dtoa-short@0.3.5
	dtoa@1.0.11
	dunce@1.0.5
	dyn-clone@1.0.20
	either@1.15.0
	embed-resource@3.0.8
	embed_plist@1.2.2
	encoding_rs@0.8.35
	enum-as-inner@0.6.1
	env_filter@2.0.0
	env_logger@0.11.11
	equator-macro@0.4.2
	equator@0.4.2
	equivalent@1.0.2
	erased-serde@0.4.10
	errno@0.3.14
	error-code@3.3.2
	esaxx-rs@0.1.10
	exr@1.74.0
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fast_image_resize@5.5.0
	fastrand@2.3.0
	fax@0.2.6
	fax_derive@0.2.0
	fdeflate@0.3.7
	field-offset@0.3.6
	filetime@0.2.27
	find-msvc-tools@0.1.9
	flate2@1.1.9
	fnv@1.0.7
	foldhash@0.1.5
	foldhash@0.2.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	form_urlencoded@1.2.2
	futf@0.1.5
	futures-channel@0.3.32
	futures-core@0.3.32
	futures-executor@0.3.32
	futures-io@0.3.32
	futures-macro@0.3.32
	futures-sink@0.3.32
	futures-task@0.3.32
	futures-util@0.3.32
	futures@0.3.32
	fxhash@0.2.1
	gdk-pixbuf-sys@0.18.0
	gdk-pixbuf@0.18.5
	gdk-sys@0.18.2
	gdk@0.18.2
	gdkwayland-sys@0.18.2
	gdkx11-sys@0.18.2
	gdkx11@0.18.2
	generic-array@0.14.7
	gethostname@1.1.0
	getrandom@0.1.16
	getrandom@0.2.17
	getrandom@0.3.4
	getrandom@0.4.2
	gif@0.14.1
	gio-sys@0.18.1
	gio@0.18.4
	glib-macros@0.18.5
	glib-sys@0.18.1
	glib@0.18.5
	glob@0.3.3
	gobject-sys@0.18.0
	gtk-sys@0.18.2
	gtk3-macros@0.18.2
	gtk@0.18.2
	h2@0.4.13
	half@2.7.1
	hash32@0.3.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.5
	hashbrown@0.16.1
	hashlink@0.9.1
	heapless@0.8.0
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.5.2
	hex@0.4.3
	hnsw_rs@0.3.4
	html5ever@0.29.1
	html5ever@0.38.0
	http-body-util@0.1.3
	http-body@1.0.1
	http-range@0.1.5
	http@1.4.0
	httparse@1.10.1
	hyper-rustls@0.27.7
	hyper-tls@0.6.0
	hyper-util@0.1.20
	hyper@1.8.1
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.65
	ico@0.5.0
	icu_collections@2.1.1
	icu_locale_core@2.1.1
	icu_normalizer@2.1.1
	icu_normalizer_data@2.1.1
	icu_properties@2.1.2
	icu_properties_data@2.1.2
	icu_provider@2.1.1
	id-arena@2.3.0
	ident_case@1.0.1
	idna@1.1.0
	idna_adapter@1.2.1
	image-webp@0.2.4
	image@0.25.10
	imagesize@0.13.0
	imgref@1.12.0
	indexmap@1.9.3
	indexmap@2.13.0
	infer@0.19.0
	interpolate_name@0.2.4
	ipnet@2.12.0
	iri-string@0.7.12
	is-docker@0.2.0
	is-wsl@0.4.0
	is_terminal_polyfill@1.70.2
	itertools@0.11.0
	itertools@0.12.1
	itertools@0.14.0
	itoa@1.0.18
	javascriptcore-rs-sys@1.1.1
	javascriptcore-rs@1.1.2
	jiff-core@0.1.0
	jiff-static@0.2.34
	jiff@0.2.34
	jni-sys-macros@0.4.1
	jni-sys@0.3.1
	jni-sys@0.4.1
	jni@0.21.1
	jobserver@0.1.34
	js-sys@0.3.92
	json-patch@3.0.1
	jsonptr@0.6.3
	jxl-bitstream@1.1.0
	jxl-coding@1.0.1
	jxl-color@0.11.0
	jxl-frame@0.13.3
	jxl-grid@0.6.1
	jxl-image@0.13.0
	jxl-jbr@0.2.1
	jxl-modular@0.11.2
	jxl-oxide-common@1.0.0
	jxl-oxide@0.12.5
	jxl-render@0.12.3
	jxl-threadpool@1.0.0
	jxl-vardct@0.11.1
	kamadak-exif@0.6.1
	keyboard-types@0.7.0
	kuchikiki@0.8.8-speedreader
	lazy_static@1.5.0
	leb128fmt@0.1.0
	lebe@0.5.3
	libappindicator-sys@0.9.0
	libappindicator@0.9.0
	libc@0.2.183
	libdbus-sys@0.2.7
	libfuzzer-sys@0.4.12
	libloading@0.7.4
	libm@0.2.16
	libredox@0.1.15
	libsqlite3-sys@0.30.1
	linux-raw-sys@0.12.1
	litemap@0.8.1
	litrs@1.0.0
	little_exif@0.6.23
	lock_api@0.4.14
	log@0.4.29
	loop9@0.1.5
	lru-slab@0.1.2
	mac@0.1.1
	mach2@0.4.3
	macro_rules_attribute-proc_macro@0.2.2
	macro_rules_attribute@0.2.2
	malloc_buf@0.0.6
	markup5ever@0.14.1
	markup5ever@0.38.0
	match_token@0.1.0
	matches@0.1.10
	matrixmultiply@0.3.10
	maybe-rayon@0.1.1
	memchr@2.8.0
	memoffset@0.9.1
	mime@0.3.17
	minimal-lexical@0.2.1
	minisign-verify@0.2.5
	miniz_oxide@0.8.9
	mio@1.2.0
	mmap-rs@0.7.0
	monostate-impl@0.1.18
	monostate@0.1.18
	moxcms@0.8.1
	muda@0.17.1
	mutate_once@0.1.2
	native-tls@0.2.18
	ndarray@0.16.1
	ndk-context@0.1.1
	ndk-sys@0.6.0+11769913
	ndk@0.9.0
	new_debug_unreachable@1.0.6
	nix@0.30.1
	nodrop@0.1.14
	nom@7.1.3
	nom@8.0.0
	noop_proc_macro@0.3.0
	normpath@1.5.0
	num-bigint@0.4.6
	num-complex@0.4.6
	num-conv@0.2.1
	num-derive@0.4.2
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num_cpus@1.17.0
	num_enum@0.7.6
	num_enum_derive@0.7.6
	objc2-app-kit@0.3.2
	objc2-cloud-kit@0.3.2
	objc2-core-data@0.3.2
	objc2-core-foundation@0.3.2
	objc2-core-graphics@0.3.2
	objc2-core-image@0.3.2
	objc2-core-location@0.3.2
	objc2-core-text@0.3.2
	objc2-core-video@0.3.2
	objc2-encode@4.1.0
	objc2-exception-helper@0.1.1
	objc2-foundation@0.3.2
	objc2-io-surface@0.3.2
	objc2-osa-kit@0.3.2
	objc2-quartz-core@0.3.2
	objc2-ui-kit@0.3.2
	objc2-user-notifications@0.3.2
	objc2-web-kit@0.3.2
	objc2@0.6.4
	objc@0.2.7
	once_cell@1.21.4
	once_cell_polyfill@1.70.2
	onig@6.5.1
	onig_sys@69.9.1
	open@5.3.3
	opener@0.7.2
	openssl-macros@0.1.1
	openssl-probe@0.2.1
	openssl-sys@0.9.112
	openssl@0.10.76
	option-ext@0.2.0
	ort-sys@2.0.0-rc.10
	ort@2.0.0-rc.10
	os_info@3.14.0
	os_pipe@1.2.3
	osakit@0.3.1
	pango-sys@0.18.0
	pango@0.18.3
	parking_lot@0.12.5
	parking_lot_core@0.9.12
	paste@1.0.15
	pastey@0.1.1
	pathdiff@0.2.3
	pem-rfc7468@1.0.0
	percent-encoding@2.3.2
	phf@0.10.1
	phf@0.11.3
	phf@0.13.1
	phf@0.8.0
	phf_codegen@0.11.3
	phf_codegen@0.13.1
	phf_codegen@0.8.0
	phf_generator@0.10.0
	phf_generator@0.11.3
	phf_generator@0.13.1
	phf_generator@0.8.0
	phf_macros@0.10.0
	phf_macros@0.11.3
	phf_macros@0.13.1
	phf_shared@0.10.0
	phf_shared@0.11.3
	phf_shared@0.13.1
	phf_shared@0.8.0
	pin-project-lite@0.2.17
	pin-utils@0.1.0
	pinyin@0.10.0
	pkg-config@0.3.32
	plain@0.2.3
	plist@1.8.0
	png@0.17.16
	png@0.18.1
	portable-atomic-util@0.2.6
	portable-atomic@1.13.1
	potential_utf@0.1.4
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	precomputed-hash@0.1.1
	prettyplease@0.2.37
	proc-macro-crate@1.3.1
	proc-macro-crate@2.0.2
	proc-macro-crate@3.5.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.106
	profiling-procmacros@1.0.17
	profiling@1.0.17
	pxfm@0.1.28
	qoi@0.4.1
	quick-error@2.0.1
	quick-xml@0.37.5
	quick-xml@0.38.4
	quinn-proto@0.11.14
	quinn-udp@0.5.14
	quinn@0.11.9
	quote@1.0.45
	r-efi@5.3.0
	r-efi@6.0.0
	rand@0.7.3
	rand@0.8.5
	rand@0.9.2
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_chacha@0.9.0
	rand_core@0.5.1
	rand_core@0.6.4
	rand_core@0.9.5
	rand_hc@0.2.0
	rand_pcg@0.2.1
	rav1e@0.8.1
	ravif@0.13.0
	raw-window-handle@0.6.2
	rawpointer@0.2.1
	rayon-cond@0.3.0
	rayon-core@1.13.0
	rayon@1.11.0
	redox_syscall@0.5.18
	redox_syscall@0.7.3
	redox_users@0.4.6
	redox_users@0.5.2
	ref-cast-impl@1.0.25
	ref-cast@1.0.25
	regex-automata@0.4.14
	regex-syntax@0.8.10
	regex@1.12.3
	reqwest@0.12.28
	reqwest@0.13.2
	rfd@0.16.0
	rgb@0.8.53
	ring@0.17.14
	rstar@0.12.2
	rusqlite@0.32.1
	rustc-hash@2.1.2
	rustc_version@0.4.1
	rustix@1.1.4
	rustls-native-certs@0.8.3
	rustls-pki-types@1.14.0
	rustls-platform-verifier-android@0.1.1
	rustls-platform-verifier@0.6.2
	rustls-webpki@0.103.10
	rustls@0.23.37
	rustversion@1.0.22
	ryu@1.0.23
	same-file@1.0.6
	schannel@0.1.29
	schemars@0.8.22
	schemars@0.9.0
	schemars@1.2.1
	schemars_derive@0.8.22
	scopeguard@1.2.0
	security-framework-sys@2.17.0
	security-framework@3.7.0
	selectors@0.24.0
	selectors@0.36.1
	semver@1.0.27
	serde-untagged@0.1.9
	serde@1.0.228
	serde_core@1.0.228
	serde_derive@1.0.228
	serde_derive_internals@0.29.1
	serde_json@1.0.149
	serde_repr@0.1.20
	serde_spanned@0.6.9
	serde_spanned@1.1.0
	serde_urlencoded@0.7.1
	serde_with@3.18.0
	serde_with_macros@3.18.0
	serialize-to-javascript-impl@0.1.2
	serialize-to-javascript@0.1.2
	servo_arc@0.2.0
	servo_arc@0.4.3
	sha2@0.10.9
	shared_child@1.1.1
	shlex@1.3.0
	sigchld@0.2.4
	signal-hook-registry@1.4.8
	signal-hook@0.3.18
	simd-adler32@0.3.9
	simd_helpers@0.1.0
	siphasher@0.3.11
	siphasher@1.0.2
	slab@0.4.12
	smallvec@1.15.1
	smallvec@2.0.0-alpha.10
	socket2@0.6.3
	socks@0.3.4
	softbuffer@0.4.8
	soup3-sys@0.5.0
	soup3@0.5.0
	spm_precompiled@0.1.4
	stable_deref_trait@1.2.1
	string_cache@0.8.9
	string_cache@0.9.0
	string_cache_codegen@0.5.4
	string_cache_codegen@0.6.1
	strsim@0.11.1
	subtle@2.6.1
	swift-rs@1.0.7
	syn@1.0.109
	syn@2.0.117
	sync_wrapper@1.0.2
	synstructure@0.13.2
	sys-locale@0.3.2
	sysctl@0.6.0
	system-configuration-sys@0.6.0
	system-configuration@0.7.0
	system-deps@6.2.2
	tao-macros@0.1.3
	tao@0.34.8
	tar@0.4.45
	target-lexicon@0.12.16
	tauri-build@2.5.6
	tauri-codegen@2.5.5
	tauri-macros@2.5.5
	tauri-plugin-aptabase@1.0.0
	tauri-plugin-dialog@2.6.0
	tauri-plugin-fs@2.4.5
	tauri-plugin-os@2.3.2
	tauri-plugin-process@2.3.1
	tauri-plugin-shell@2.3.5
	tauri-plugin-updater@2.10.0
	tauri-plugin-window-state@2.4.1
	tauri-plugin@2.5.4
	tauri-runtime-wry@2.10.1
	tauri-runtime@2.10.1
	tauri-utils@2.8.3
	tauri-winres@0.3.5
	tauri@2.10.3
	tempfile@3.27.0
	tendril@0.4.3
	tendril@0.5.0
	thiserror-impl@1.0.69
	thiserror-impl@2.0.18
	thiserror@1.0.69
	thiserror@2.0.18
	tiff@0.11.3
	time-core@0.1.8
	time-macros@0.2.27
	time@0.3.47
	tinystr@0.8.2
	tinyvec@1.11.0
	tinyvec_macros@0.1.1
	tokenizers@0.20.4
	tokio-macros@2.6.1
	tokio-native-tls@0.3.1
	tokio-rustls@0.26.4
	tokio-util@0.7.18
	tokio@1.50.0
	toml@0.8.2
	toml@0.9.12+spec-1.1.0
	toml_datetime@0.6.3
	toml_datetime@0.7.5+spec-1.1.0
	toml_datetime@1.1.0+spec-1.1.0
	toml_edit@0.19.15
	toml_edit@0.20.2
	toml_edit@0.25.8+spec-1.1.0
	toml_parser@1.1.0+spec-1.1.0
	toml_writer@1.1.0+spec-1.1.0
	tower-http@0.6.8
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.3
	tracing-core@0.1.36
	tracing@0.1.44
	trash@3.3.1
	tray-icon@0.21.3
	try-lock@0.2.5
	typeid@1.0.3
	typenum@1.19.0
	unic-char-property@0.9.0
	unic-char-range@0.9.0
	unic-common@0.9.0
	unic-ucd-ident@0.9.0
	unic-ucd-version@0.9.0
	unicode-ident@1.0.24
	unicode-normalization-alignments@0.1.12
	unicode-segmentation@1.13.2
	unicode-xid@0.2.6
	unicode_categories@0.1.1
	untrusted@0.9.0
	ureq-proto@0.6.0
	ureq@3.3.0
	url@2.5.8
	urlpattern@0.3.0
	utf-8@0.7.6
	utf8-zero@0.8.1
	utf8_iter@1.0.4
	utf8parse@0.2.2
	uuid@1.23.0
	v_frame@0.3.9
	vcpkg@0.2.15
	version-compare@0.2.1
	version_check@0.9.5
	vswhom-sys@0.1.3
	vswhom@0.1.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.1+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasip2@1.0.2+wasi-0.2.9
	wasip3@0.4.0+wasi-0.3.0-rc-2026-01-06
	wasm-bindgen-futures@0.4.65
	wasm-bindgen-macro-support@0.2.115
	wasm-bindgen-macro@0.2.115
	wasm-bindgen-shared@0.2.115
	wasm-bindgen@0.2.115
	wasm-encoder@0.244.0
	wasm-metadata@0.244.0
	wasm-streams@0.5.0
	wasmparser@0.244.0
	web-sys@0.3.92
	web-time@1.1.0
	web_atoms@0.2.3
	webkit2gtk-sys@2.0.2
	webkit2gtk@2.0.2
	webpki-root-certs@1.0.6
	webpki-roots@1.0.6
	webview2-com-macros@0.8.1
	webview2-com-sys@0.38.2
	webview2-com@0.38.2
	weezl@0.1.12
	widestring@1.2.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.11
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	window-vibrancy@0.6.0
	windows-collections@0.2.0
	windows-core@0.52.0
	windows-core@0.58.0
	windows-core@0.61.2
	windows-core@0.62.2
	windows-future@0.2.1
	windows-implement@0.52.0
	windows-implement@0.58.0
	windows-implement@0.60.2
	windows-interface@0.52.0
	windows-interface@0.58.0
	windows-interface@0.59.3
	windows-link@0.1.3
	windows-link@0.2.1
	windows-numerics@0.2.0
	windows-registry@0.6.1
	windows-result@0.2.0
	windows-result@0.3.4
	windows-result@0.4.1
	windows-strings@0.1.0
	windows-strings@0.4.2
	windows-strings@0.5.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-sys@0.61.2
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows-targets@0.53.5
	windows-threading@0.1.0
	windows-version@0.1.7
	windows@0.44.0
	windows@0.48.0
	windows@0.52.0
	windows@0.61.3
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.1
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.1
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.1
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.1
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.1
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.1
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.1
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.1
	winnow@0.5.40
	winnow@0.7.15
	winnow@1.0.0
	winreg@0.55.0
	wit-bindgen-core@0.51.0
	wit-bindgen-rust-macro@0.51.0
	wit-bindgen-rust@0.51.0
	wit-bindgen@0.51.0
	wit-component@0.244.0
	wit-parser@0.244.0
	writeable@0.6.2
	wry@0.54.4
	x11-dl@2.21.0
	x11@2.21.0
	x11rb-protocol@0.13.2
	x11rb@0.13.2
	xattr@1.6.1
	y4m@0.8.0
	yoke-derive@0.8.1
	yoke@0.8.1
	zerocopy-derive@0.8.48
	zerocopy@0.8.48
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zeroize@1.8.2
	zerotrie@0.2.3
	zerovec-derive@0.11.2
	zerovec@0.11.5
	zip@2.4.2
	zip@4.6.1
	zmij@1.0.21
	zopfli@0.8.3
	zune-core@0.5.1
	zune-inflate@0.2.54
	zune-jpeg@0.5.15
"

inherit cargo desktop xdg

LIBRAW_COMMIT="b860248a89d9082b8e0a1e202e516f46af9adb29"
LIBJPEG_COMMIT="9217719d3a58633923b096af4c1d50d304768a64"
LIBHEIF_COMMIT="62f1b8c76ed4d8305071fdacbe74ef9717bacac5"
LIBDE265_COMMIT="3cd9fbf15ae30edafa22a29fdd8a89355ad52ad0"
CLIP_COMMIT="3d74acf9a28c67741b2f4f2ea7635f0aaf6f0268"
XENOVA_COMMIT="d15189d7028b43f1d3e65039190477f6af591c2a"
INSIGHTFACE_COMMIT="4e1f33d3fe0e50a0945f3a53ab94ae8977ae7ddb"

NPM_REGISTRY="https://registry.npmjs.org"
HF_URI="https://huggingface.co"

NPM_DEPENDENCIES="
	${NPM_REGISTRY}/@alloc/quick-lru/-/quick-lru-5.2.0.tgz -> ${P}-npm-827a78a8e7d58eb8.tgz
	${NPM_REGISTRY}/@babel/code-frame/-/code-frame-7.29.7.tgz -> ${P}-npm-c44df73089d93f2e.tgz
	${NPM_REGISTRY}/@babel/compat-data/-/compat-data-7.29.7.tgz -> ${P}-npm-d5f9be10c3dc2855.tgz
	${NPM_REGISTRY}/@babel/core/-/core-7.29.7.tgz -> ${P}-npm-0d305cb4ced64ea6.tgz
	${NPM_REGISTRY}/@babel/generator/-/generator-7.29.7.tgz -> ${P}-npm-501bd9946d0c895f.tgz
	${NPM_REGISTRY}/@babel/generator/-/generator-8.0.0-rc.6.tgz -> ${P}-npm-3800d2aa5fa71a64.tgz
	${NPM_REGISTRY}/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.29.7.tgz -> ${P}-npm-3d52555a9d2e4749.tgz
	${NPM_REGISTRY}/@babel/helper-compilation-targets/-/helper-compilation-targets-7.29.7.tgz \
		-> ${P}-npm-fa7d5881406a1725.tgz
	${NPM_REGISTRY}/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.29.7.tgz \
		-> ${P}-npm-11f4d306606fce53.tgz
	${NPM_REGISTRY}/@babel/helper-globals/-/helper-globals-7.29.7.tgz -> ${P}-npm-f1b4eee8634b34af.tgz
	${NPM_REGISTRY}/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.29.7.tgz \
		-> ${P}-npm-09435c51b067f149.tgz
	${NPM_REGISTRY}/@babel/helper-module-imports/-/helper-module-imports-7.29.7.tgz -> ${P}-npm-bb2eb4cd9d8b31db.tgz
	${NPM_REGISTRY}/@babel/helper-module-transforms/-/helper-module-transforms-7.29.7.tgz -> ${P}-npm-f77f56e5c6b970e0.tgz
	${NPM_REGISTRY}/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.29.7.tgz \
		-> ${P}-npm-b25c036563e50273.tgz
	${NPM_REGISTRY}/@babel/helper-plugin-utils/-/helper-plugin-utils-7.29.7.tgz -> ${P}-npm-865d87a429acd360.tgz
	${NPM_REGISTRY}/@babel/helper-replace-supers/-/helper-replace-supers-7.29.7.tgz -> ${P}-npm-666287bfa0a46b26.tgz
	${NPM_REGISTRY}/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.29.7.tgz \
		-> ${P}-npm-aa41e4d82d9a5b15.tgz
	${NPM_REGISTRY}/@babel/helper-string-parser/-/helper-string-parser-7.29.7.tgz -> ${P}-npm-7ef27fdfe104c9f2.tgz
	${NPM_REGISTRY}/@babel/helper-string-parser/-/helper-string-parser-8.0.0-rc.6.tgz -> ${P}-npm-e2cfca48378c698c.tgz
	${NPM_REGISTRY}/@babel/helper-validator-identifier/-/helper-validator-identifier-7.29.7.tgz \
		-> ${P}-npm-5fb076de103c316e.tgz
	${NPM_REGISTRY}/@babel/helper-validator-identifier/-/helper-validator-identifier-8.0.0-rc.6.tgz \
		-> ${P}-npm-735065ceb42f8ebb.tgz
	${NPM_REGISTRY}/@babel/helper-validator-option/-/helper-validator-option-7.29.7.tgz -> ${P}-npm-637d82a3c0422afa.tgz
	${NPM_REGISTRY}/@babel/helpers/-/helpers-7.29.7.tgz -> ${P}-npm-8c9754c675cca24e.tgz
	${NPM_REGISTRY}/@babel/parser/-/parser-7.29.7.tgz -> ${P}-npm-d7f0ad43aa10f2bf.tgz
	${NPM_REGISTRY}/@babel/parser/-/parser-8.0.0-rc.6.tgz -> ${P}-npm-79e6e3e2b642ff23.tgz
	${NPM_REGISTRY}/@babel/plugin-proposal-decorators/-/plugin-proposal-decorators-7.29.7.tgz \
		-> ${P}-npm-5efe1abd6d6aac30.tgz
	${NPM_REGISTRY}/@babel/plugin-syntax-decorators/-/plugin-syntax-decorators-7.29.7.tgz -> ${P}-npm-47a5970375c28735.tgz
	${NPM_REGISTRY}/@babel/plugin-syntax-import-attributes/-/plugin-syntax-import-attributes-7.29.7.tgz \
		-> ${P}-npm-9a743256637359f4.tgz
	${NPM_REGISTRY}/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz \
		-> ${P}-npm-2ad0ed7919d25436.tgz
	${NPM_REGISTRY}/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.29.7.tgz -> ${P}-npm-7849f0e702e878a1.tgz
	${NPM_REGISTRY}/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.29.7.tgz -> ${P}-npm-69c2a492accd6a77.tgz
	${NPM_REGISTRY}/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.29.7.tgz \
		-> ${P}-npm-7de076b396d36740.tgz
	${NPM_REGISTRY}/@babel/runtime/-/runtime-7.29.7.tgz -> ${P}-npm-90c62455b8372274.tgz
	${NPM_REGISTRY}/@babel/template/-/template-7.29.7.tgz -> ${P}-npm-72690a7e810df1fe.tgz
	${NPM_REGISTRY}/@babel/traverse/-/traverse-7.29.7.tgz -> ${P}-npm-9c454f759143d291.tgz
	${NPM_REGISTRY}/@babel/types/-/types-7.29.7.tgz -> ${P}-npm-e8aa37c905f09564.tgz
	${NPM_REGISTRY}/@babel/types/-/types-8.0.0-rc.6.tgz -> ${P}-npm-e828bbbe015a5bfa.tgz
	${NPM_REGISTRY}/@emnapi/core/-/core-1.10.0.tgz -> ${P}-npm-93114ae15f46091c.tgz
	${NPM_REGISTRY}/@emnapi/runtime/-/runtime-1.10.0.tgz -> ${P}-npm-d90b2cbf3950a376.tgz
	${NPM_REGISTRY}/@emnapi/wasi-threads/-/wasi-threads-1.2.1.tgz -> ${P}-npm-7a10b7f69f90f0e4.tgz
	${NPM_REGISTRY}/@intlify/core-base/-/core-base-11.4.5.tgz -> ${P}-npm-99825ddea8c1ff05.tgz
	${NPM_REGISTRY}/@intlify/devtools-types/-/devtools-types-11.4.5.tgz -> ${P}-npm-b420fb06c451a3e5.tgz
	${NPM_REGISTRY}/@intlify/message-compiler/-/message-compiler-11.4.5.tgz -> ${P}-npm-832140e191bd1f3c.tgz
	${NPM_REGISTRY}/@intlify/shared/-/shared-11.4.5.tgz -> ${P}-npm-0de81198c48071e1.tgz
	${NPM_REGISTRY}/@jridgewell/gen-mapping/-/gen-mapping-0.3.13.tgz -> ${P}-npm-f48cc9e94567610d.tgz
	${NPM_REGISTRY}/@jridgewell/remapping/-/remapping-2.3.5.tgz -> ${P}-npm-a2ff2723fcada37d.tgz
	${NPM_REGISTRY}/@jridgewell/resolve-uri/-/resolve-uri-3.1.2.tgz -> ${P}-npm-4e87bc8f7e821e6b.tgz
	${NPM_REGISTRY}/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.5.5.tgz -> ${P}-npm-32ffb18d0b00e794.tgz
	${NPM_REGISTRY}/@jridgewell/trace-mapping/-/trace-mapping-0.3.31.tgz -> ${P}-npm-f5f65da42f3338c7.tgz
	${NPM_REGISTRY}/@napi-rs/wasm-runtime/-/wasm-runtime-1.1.5.tgz -> ${P}-npm-136f6e0535f23b65.tgz
	${NPM_REGISTRY}/@oxc-project/types/-/types-0.133.0.tgz -> ${P}-npm-70c157542c626a47.tgz
	${NPM_REGISTRY}/@polka/url/-/url-1.0.0-next.29.tgz -> ${P}-npm-18f4054804513972.tgz
	${NPM_REGISTRY}/@rolldown/binding-android-arm64/-/binding-android-arm64-1.0.3.tgz -> ${P}-npm-5ed9b5ceb11888bb.tgz
	${NPM_REGISTRY}/@rolldown/binding-darwin-arm64/-/binding-darwin-arm64-1.0.3.tgz -> ${P}-npm-af3ae311231892f2.tgz
	${NPM_REGISTRY}/@rolldown/binding-darwin-x64/-/binding-darwin-x64-1.0.3.tgz -> ${P}-npm-052682711cebd6c6.tgz
	${NPM_REGISTRY}/@rolldown/binding-freebsd-x64/-/binding-freebsd-x64-1.0.3.tgz -> ${P}-npm-baa5db68bd428120.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-arm-gnueabihf/-/binding-linux-arm-gnueabihf-1.0.3.tgz \
		-> ${P}-npm-576e4d72f18352fe.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-arm64-gnu/-/binding-linux-arm64-gnu-1.0.3.tgz -> ${P}-npm-c785ee1465819a8a.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-arm64-musl/-/binding-linux-arm64-musl-1.0.3.tgz \
		-> ${P}-npm-515dd097cbff2cf3.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-ppc64-gnu/-/binding-linux-ppc64-gnu-1.0.3.tgz -> ${P}-npm-44495df76a1357f4.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-s390x-gnu/-/binding-linux-s390x-gnu-1.0.3.tgz -> ${P}-npm-e0dfc84eb1abede0.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-x64-gnu/-/binding-linux-x64-gnu-1.0.3.tgz -> ${P}-npm-2cc9d6d5ff10502a.tgz
	${NPM_REGISTRY}/@rolldown/binding-linux-x64-musl/-/binding-linux-x64-musl-1.0.3.tgz -> ${P}-npm-59ddb6ac2d2ee2a5.tgz
	${NPM_REGISTRY}/@rolldown/binding-openharmony-arm64/-/binding-openharmony-arm64-1.0.3.tgz \
		-> ${P}-npm-97fbc1db0c94ae65.tgz
	${NPM_REGISTRY}/@rolldown/binding-wasm32-wasi/-/binding-wasm32-wasi-1.0.3.tgz -> ${P}-npm-748ac41b027314ac.tgz
	${NPM_REGISTRY}/@rolldown/binding-win32-arm64-msvc/-/binding-win32-arm64-msvc-1.0.3.tgz \
		-> ${P}-npm-e299aca9fd9d505c.tgz
	${NPM_REGISTRY}/@rolldown/binding-win32-x64-msvc/-/binding-win32-x64-msvc-1.0.3.tgz -> ${P}-npm-d2017a151ed0bb39.tgz
	${NPM_REGISTRY}/@rolldown/pluginutils/-/pluginutils-1.0.1.tgz -> ${P}-npm-a11950e6d1dc0dfd.tgz
	${NPM_REGISTRY}/@tailwindcss/node/-/node-4.3.0.tgz -> ${P}-npm-e12022146a20162b.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-android-arm64/-/oxide-android-arm64-4.3.0.tgz -> ${P}-npm-c4f95daeca9d342b.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-darwin-arm64/-/oxide-darwin-arm64-4.3.0.tgz -> ${P}-npm-77c7cb735522eb7c.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-darwin-x64/-/oxide-darwin-x64-4.3.0.tgz -> ${P}-npm-c949e43d0d60916f.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-freebsd-x64/-/oxide-freebsd-x64-4.3.0.tgz -> ${P}-npm-2fa2826a066f9e2f.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-linux-arm-gnueabihf/-/oxide-linux-arm-gnueabihf-4.3.0.tgz \
		-> ${P}-npm-98fc7a0a08b8fcf8.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-linux-arm64-gnu/-/oxide-linux-arm64-gnu-4.3.0.tgz -> ${P}-npm-f3614993e485a01f.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-linux-arm64-musl/-/oxide-linux-arm64-musl-4.3.0.tgz -> ${P}-npm-a4663212ff440278.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-linux-x64-gnu/-/oxide-linux-x64-gnu-4.3.0.tgz -> ${P}-npm-8e2b0e73ffecf4b6.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-linux-x64-musl/-/oxide-linux-x64-musl-4.3.0.tgz -> ${P}-npm-7c6e520f9b4faa95.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-wasm32-wasi/-/oxide-wasm32-wasi-4.3.0.tgz -> ${P}-npm-fb5579bc3bf892d3.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-win32-arm64-msvc/-/oxide-win32-arm64-msvc-4.3.0.tgz -> ${P}-npm-c7beb8000f44af67.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide-win32-x64-msvc/-/oxide-win32-x64-msvc-4.3.0.tgz -> ${P}-npm-1611840722bdc6a1.tgz
	${NPM_REGISTRY}/@tailwindcss/oxide/-/oxide-4.3.0.tgz -> ${P}-npm-9115092cbad8fdf2.tgz
	${NPM_REGISTRY}/@tailwindcss/postcss/-/postcss-4.3.0.tgz -> ${P}-npm-beda7c244ae36693.tgz
	${NPM_REGISTRY}/@tailwindcss/vite/-/vite-4.3.0.tgz -> ${P}-npm-1fd1dcf6d276e293.tgz
	${NPM_REGISTRY}/@tauri-apps/api/-/api-2.11.0.tgz -> ${P}-npm-0bad7775e535acac.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-dialog/-/plugin-dialog-2.6.0.tgz -> ${P}-npm-8e6acf58e0bcc7cf.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-fs/-/plugin-fs-2.4.5.tgz -> ${P}-npm-05d6eec34840e24f.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-os/-/plugin-os-2.3.2.tgz -> ${P}-npm-0525288b6ed7aad3.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-process/-/plugin-process-2.3.1.tgz -> ${P}-npm-ecec7a5961c77e2b.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-shell/-/plugin-shell-2.3.5.tgz -> ${P}-npm-7133abe95c19238e.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-updater/-/plugin-updater-2.10.0.tgz -> ${P}-npm-5b5731fffb98f04f.tgz
	${NPM_REGISTRY}/@tauri-apps/plugin-window-state/-/plugin-window-state-2.4.1.tgz -> ${P}-npm-71f2bd48cf0e97b2.tgz
	${NPM_REGISTRY}/@tybys/wasm-util/-/wasm-util-0.10.2.tgz -> ${P}-npm-935e5c90371dc09f.tgz
	${NPM_REGISTRY}/@types/jsesc/-/jsesc-2.5.1.tgz -> ${P}-npm-15617ddccdcf2990.tgz
	${NPM_REGISTRY}/@types/node/-/node-25.9.2.tgz -> ${P}-npm-1dd0b80b2ad05fe9.tgz
	${NPM_REGISTRY}/@types/sortablejs/-/sortablejs-1.15.9.tgz -> ${P}-npm-2934c96777dd230d.tgz
	${NPM_REGISTRY}/@videojs/http-streaming/-/http-streaming-3.17.4.tgz -> ${P}-npm-5d0c55969558abfd.tgz
	${NPM_REGISTRY}/@videojs/vhs-utils/-/vhs-utils-4.1.1.tgz -> ${P}-npm-1df135ac7e25add4.tgz
	${NPM_REGISTRY}/@videojs/xhr/-/xhr-2.7.0.tgz -> ${P}-npm-631df4ac0778d570.tgz
	${NPM_REGISTRY}/@vitejs/plugin-vue/-/plugin-vue-6.0.7.tgz -> ${P}-npm-f4f48449571e3bba.tgz
	${NPM_REGISTRY}/@vue-macros/common/-/common-3.1.2.tgz -> ${P}-npm-fbd4bd5416ca9e46.tgz
	${NPM_REGISTRY}/@vue/babel-helper-vue-transform-on/-/babel-helper-vue-transform-on-1.5.0.tgz \
		-> ${P}-npm-b095294ad8e76634.tgz
	${NPM_REGISTRY}/@vue/babel-plugin-jsx/-/babel-plugin-jsx-1.5.0.tgz -> ${P}-npm-6c03298ed22d4300.tgz
	${NPM_REGISTRY}/@vue/babel-plugin-resolve-type/-/babel-plugin-resolve-type-1.5.0.tgz -> ${P}-npm-1193c619e39d5162.tgz
	${NPM_REGISTRY}/@vue/compiler-core/-/compiler-core-3.5.35.tgz -> ${P}-npm-6435c39155afa851.tgz
	${NPM_REGISTRY}/@vue/compiler-dom/-/compiler-dom-3.5.35.tgz -> ${P}-npm-c29a7c8b6027fb00.tgz
	${NPM_REGISTRY}/@vue/compiler-sfc/-/compiler-sfc-3.5.35.tgz -> ${P}-npm-c15613d4e40e8611.tgz
	${NPM_REGISTRY}/@vue/compiler-ssr/-/compiler-ssr-3.5.35.tgz -> ${P}-npm-dd4b56069a0415b4.tgz
	${NPM_REGISTRY}/@vue/devtools-api/-/devtools-api-6.6.4.tgz -> ${P}-npm-4af57567c30a91c8.tgz
	${NPM_REGISTRY}/@vue/devtools-api/-/devtools-api-7.7.9.tgz -> ${P}-npm-34d3796fe0bff36c.tgz
	${NPM_REGISTRY}/@vue/devtools-api/-/devtools-api-8.1.2.tgz -> ${P}-npm-18f2bb73d441b0e7.tgz
	${NPM_REGISTRY}/@vue/devtools-core/-/devtools-core-8.1.2.tgz -> ${P}-npm-ce46010d7db14d1b.tgz
	${NPM_REGISTRY}/@vue/devtools-kit/-/devtools-kit-7.7.9.tgz -> ${P}-npm-c132a9338d4cb1c1.tgz
	${NPM_REGISTRY}/@vue/devtools-kit/-/devtools-kit-8.1.2.tgz -> ${P}-npm-8577f4ef248cb71c.tgz
	${NPM_REGISTRY}/@vue/devtools-shared/-/devtools-shared-7.7.9.tgz -> ${P}-npm-250daf610d190ca0.tgz
	${NPM_REGISTRY}/@vue/devtools-shared/-/devtools-shared-8.1.2.tgz -> ${P}-npm-25cbc71455d03d89.tgz
	${NPM_REGISTRY}/@vue/reactivity/-/reactivity-3.5.35.tgz -> ${P}-npm-c4f5365387addd11.tgz
	${NPM_REGISTRY}/@vue/runtime-core/-/runtime-core-3.5.35.tgz -> ${P}-npm-0a4d69db6fc3e328.tgz
	${NPM_REGISTRY}/@vue/runtime-dom/-/runtime-dom-3.5.35.tgz -> ${P}-npm-ad8f3e7777948c3f.tgz
	${NPM_REGISTRY}/@vue/server-renderer/-/server-renderer-3.5.35.tgz -> ${P}-npm-72ebbbe2d193a835.tgz
	${NPM_REGISTRY}/@vue/shared/-/shared-3.5.35.tgz -> ${P}-npm-eae0cb042f194b24.tgz
	${NPM_REGISTRY}/@xmldom/xmldom/-/xmldom-0.8.13.tgz -> ${P}-npm-521effe4c8ebdacd.tgz
	${NPM_REGISTRY}/acorn/-/acorn-8.16.0.tgz -> ${P}-npm-d444467bda765faf.tgz
	${NPM_REGISTRY}/aes-decrypter/-/aes-decrypter-4.0.2.tgz -> ${P}-npm-40e1244e243b8b38.tgz
	${NPM_REGISTRY}/ansis/-/ansis-4.3.1.tgz -> ${P}-npm-eb245ca9f4e44ad4.tgz
	${NPM_REGISTRY}/ast-kit/-/ast-kit-2.2.0.tgz -> ${P}-npm-df5941d4803515fc.tgz
	${NPM_REGISTRY}/ast-walker-scope/-/ast-walker-scope-0.9.0.tgz -> ${P}-npm-c7ddb33cc447a763.tgz
	${NPM_REGISTRY}/atomico/-/atomico-1.79.2.tgz -> ${P}-npm-2c7d7476ec71b998.tgz
	${NPM_REGISTRY}/autoprefixer/-/autoprefixer-10.5.0.tgz -> ${P}-npm-065d459b3f1b6eb5.tgz
	${NPM_REGISTRY}/baseline-browser-mapping/-/baseline-browser-mapping-2.10.35.tgz -> ${P}-npm-c494917ef89e6475.tgz
	${NPM_REGISTRY}/birpc/-/birpc-2.9.0.tgz -> ${P}-npm-b2a611d998aab08d.tgz
	${NPM_REGISTRY}/birpc/-/birpc-4.0.0.tgz -> ${P}-npm-80b83c6af2503ccd.tgz
	${NPM_REGISTRY}/boolbase/-/boolbase-1.0.0.tgz -> ${P}-npm-3b97161f634fc888.tgz
	${NPM_REGISTRY}/browserslist/-/browserslist-4.28.2.tgz -> ${P}-npm-f3c5dc5d9adf22c2.tgz
	${NPM_REGISTRY}/bundle-name/-/bundle-name-4.1.0.tgz -> ${P}-npm-73c91e3a7c7e1030.tgz
	${NPM_REGISTRY}/cally/-/cally-0.9.2.tgz -> ${P}-npm-1cca37704bf51da6.tgz
	${NPM_REGISTRY}/caniuse-lite/-/caniuse-lite-1.0.30001797.tgz -> ${P}-npm-74ac4d44b28fdb90.tgz
	${NPM_REGISTRY}/chokidar/-/chokidar-5.0.0.tgz -> ${P}-npm-1bf1ae479527dc97.tgz
	${NPM_REGISTRY}/commander/-/commander-7.2.0.tgz -> ${P}-npm-16fab5f411457757.tgz
	${NPM_REGISTRY}/confbox/-/confbox-0.1.8.tgz -> ${P}-npm-49ba697a499d7085.tgz
	${NPM_REGISTRY}/confbox/-/confbox-0.2.4.tgz -> ${P}-npm-8e2d66b42b26ca64.tgz
	${NPM_REGISTRY}/convert-source-map/-/convert-source-map-2.0.0.tgz -> ${P}-npm-153a1c964e8e749e.tgz
	${NPM_REGISTRY}/copy-anything/-/copy-anything-4.0.5.tgz -> ${P}-npm-34304545afb92777.tgz
	${NPM_REGISTRY}/css-select/-/css-select-5.2.2.tgz -> ${P}-npm-22de90a1cceaff78.tgz
	${NPM_REGISTRY}/css-tree/-/css-tree-2.2.1.tgz -> ${P}-npm-2920b5b4a473d82c.tgz
	${NPM_REGISTRY}/css-tree/-/css-tree-2.3.1.tgz -> ${P}-npm-838cc39d4679a5b3.tgz
	${NPM_REGISTRY}/css-what/-/css-what-6.2.2.tgz -> ${P}-npm-8422a848f64f6a67.tgz
	${NPM_REGISTRY}/csso/-/csso-5.0.5.tgz -> ${P}-npm-b94d164ae40a3657.tgz
	${NPM_REGISTRY}/csstype/-/csstype-3.2.3.tgz -> ${P}-npm-58646b8a59d29705.tgz
	${NPM_REGISTRY}/daisyui/-/daisyui-5.5.19.tgz -> ${P}-npm-839bb9dc1fe5960d.tgz
	${NPM_REGISTRY}/date-fns/-/date-fns-4.4.0.tgz -> ${P}-npm-2efdf7725d7b21d6.tgz
	${NPM_REGISTRY}/debug/-/debug-4.4.3.tgz -> ${P}-npm-7b09c49ed17c7dc4.tgz
	${NPM_REGISTRY}/default-browser-id/-/default-browser-id-5.0.1.tgz -> ${P}-npm-3f3df01aa8877021.tgz
	${NPM_REGISTRY}/default-browser/-/default-browser-5.5.0.tgz -> ${P}-npm-47670985411d94af.tgz
	${NPM_REGISTRY}/define-lazy-prop/-/define-lazy-prop-3.0.0.tgz -> ${P}-npm-6789d76b0af2781b.tgz
	${NPM_REGISTRY}/defu/-/defu-6.1.7.tgz -> ${P}-npm-210ae8b650ee2d64.tgz
	${NPM_REGISTRY}/detect-libc/-/detect-libc-2.1.2.tgz -> ${P}-npm-d7fefcec2f79eb28.tgz
	${NPM_REGISTRY}/dom-serializer/-/dom-serializer-2.0.0.tgz -> ${P}-npm-f29e8a8017185b92.tgz
	${NPM_REGISTRY}/dom-walk/-/dom-walk-0.1.2.tgz -> ${P}-npm-0e5e13eb3de54f5f.tgz
	${NPM_REGISTRY}/domelementtype/-/domelementtype-2.3.0.tgz -> ${P}-npm-94b58bcc5f6abcd9.tgz
	${NPM_REGISTRY}/domhandler/-/domhandler-5.0.3.tgz -> ${P}-npm-d2f533b6b3dcacae.tgz
	${NPM_REGISTRY}/domutils/-/domutils-3.2.2.tgz -> ${P}-npm-bd09083397c5ad27.tgz
	${NPM_REGISTRY}/electron-to-chromium/-/electron-to-chromium-1.5.371.tgz -> ${P}-npm-e8e9b035fce7aef5.tgz
	${NPM_REGISTRY}/enhanced-resolve/-/enhanced-resolve-5.23.0.tgz -> ${P}-npm-aee3a0422bb22b94.tgz
	${NPM_REGISTRY}/entities/-/entities-4.5.0.tgz -> ${P}-npm-070dc698e5992dc9.tgz
	${NPM_REGISTRY}/entities/-/entities-7.0.1.tgz -> ${P}-npm-2e3220e14744f778.tgz
	${NPM_REGISTRY}/error-stack-parser-es/-/error-stack-parser-es-1.0.5.tgz -> ${P}-npm-ae21da9084981d5e.tgz
	${NPM_REGISTRY}/escalade/-/escalade-3.2.0.tgz -> ${P}-npm-c4d7054b4b724651.tgz
	${NPM_REGISTRY}/estree-walker/-/estree-walker-2.0.2.tgz -> ${P}-npm-a2ea005e632974b2.tgz
	${NPM_REGISTRY}/exsolve/-/exsolve-1.0.8.tgz -> ${P}-npm-ef65e7747716cb91.tgz
	${NPM_REGISTRY}/fdir/-/fdir-6.5.0.tgz -> ${P}-npm-b2caafa9a386895c.tgz
	${NPM_REGISTRY}/fraction.js/-/fraction.js-5.3.4.tgz -> ${P}-npm-3c122dbd8a842103.tgz
	${NPM_REGISTRY}/fsevents/-/fsevents-2.3.3.tgz -> ${P}-npm-dd9c799f4afd7351.tgz
	${NPM_REGISTRY}/gensync/-/gensync-1.0.0-beta.2.tgz -> ${P}-npm-47c1d283db25ce9a.tgz
	${NPM_REGISTRY}/global/-/global-4.4.0.tgz -> ${P}-npm-bf6666ba1bf2345c.tgz
	${NPM_REGISTRY}/graceful-fs/-/graceful-fs-4.2.11.tgz -> ${P}-npm-634654bbbce94378.tgz
	${NPM_REGISTRY}/hookable/-/hookable-5.5.3.tgz -> ${P}-npm-3df512417904474f.tgz
	${NPM_REGISTRY}/is-docker/-/is-docker-3.0.0.tgz -> ${P}-npm-9ac9dc50b09b1440.tgz
	${NPM_REGISTRY}/is-function/-/is-function-1.0.2.tgz -> ${P}-npm-fdf11a95402c5494.tgz
	${NPM_REGISTRY}/is-in-ssh/-/is-in-ssh-1.0.0.tgz -> ${P}-npm-346dc7f8d704ceec.tgz
	${NPM_REGISTRY}/is-inside-container/-/is-inside-container-1.0.0.tgz -> ${P}-npm-7a9637cf0e644898.tgz
	${NPM_REGISTRY}/is-what/-/is-what-5.5.0.tgz -> ${P}-npm-56ca1d3877e1d451.tgz
	${NPM_REGISTRY}/is-wsl/-/is-wsl-3.1.1.tgz -> ${P}-npm-b3f0af571794eb13.tgz
	${NPM_REGISTRY}/jiti/-/jiti-2.7.0.tgz -> ${P}-npm-784de2221affb2a8.tgz
	${NPM_REGISTRY}/js-tokens/-/js-tokens-4.0.0.tgz -> ${P}-npm-ec142c7bc942b358.tgz
	${NPM_REGISTRY}/jsesc/-/jsesc-3.1.0.tgz -> ${P}-npm-38a171e888853366.tgz
	${NPM_REGISTRY}/json5/-/json5-2.2.3.tgz -> ${P}-npm-ec4de4b41ad2a8c7.tgz
	${NPM_REGISTRY}/kolorist/-/kolorist-1.8.0.tgz -> ${P}-npm-8092fc36ba88bd05.tgz
	${NPM_REGISTRY}/leaflet/-/leaflet-1.9.4.tgz -> ${P}-npm-4cca96bbe2ff517c.tgz
	${NPM_REGISTRY}/lightningcss-android-arm64/-/lightningcss-android-arm64-1.32.0.tgz -> ${P}-npm-fafc9373b7faf550.tgz
	${NPM_REGISTRY}/lightningcss-darwin-arm64/-/lightningcss-darwin-arm64-1.32.0.tgz -> ${P}-npm-4dd7b9c186112725.tgz
	${NPM_REGISTRY}/lightningcss-darwin-x64/-/lightningcss-darwin-x64-1.32.0.tgz -> ${P}-npm-84e7cbb0dc0186d8.tgz
	${NPM_REGISTRY}/lightningcss-freebsd-x64/-/lightningcss-freebsd-x64-1.32.0.tgz -> ${P}-npm-2574adcc71c3a9dc.tgz
	${NPM_REGISTRY}/lightningcss-linux-arm-gnueabihf/-/lightningcss-linux-arm-gnueabihf-1.32.0.tgz \
		-> ${P}-npm-577ed17bb7a3a9da.tgz
	${NPM_REGISTRY}/lightningcss-linux-arm64-gnu/-/lightningcss-linux-arm64-gnu-1.32.0.tgz -> ${P}-npm-abe24d5164230705.tgz
	${NPM_REGISTRY}/lightningcss-linux-arm64-musl/-/lightningcss-linux-arm64-musl-1.32.0.tgz \
		-> ${P}-npm-b39a5e2d24083e07.tgz
	${NPM_REGISTRY}/lightningcss-linux-x64-gnu/-/lightningcss-linux-x64-gnu-1.32.0.tgz -> ${P}-npm-86272b08ecc668f0.tgz
	${NPM_REGISTRY}/lightningcss-linux-x64-musl/-/lightningcss-linux-x64-musl-1.32.0.tgz -> ${P}-npm-76b3542da8f1e8cc.tgz
	${NPM_REGISTRY}/lightningcss-win32-arm64-msvc/-/lightningcss-win32-arm64-msvc-1.32.0.tgz \
		-> ${P}-npm-248a79961a0bece5.tgz
	${NPM_REGISTRY}/lightningcss-win32-x64-msvc/-/lightningcss-win32-x64-msvc-1.32.0.tgz -> ${P}-npm-e0b3cc8745da7732.tgz
	${NPM_REGISTRY}/lightningcss/-/lightningcss-1.32.0.tgz -> ${P}-npm-2d624121e26db4a9.tgz
	${NPM_REGISTRY}/local-pkg/-/local-pkg-1.2.1.tgz -> ${P}-npm-ec755a2035dfa0c2.tgz
	${NPM_REGISTRY}/lru-cache/-/lru-cache-5.1.1.tgz -> ${P}-npm-9a72db500d4e541d.tgz
	${NPM_REGISTRY}/m3u8-parser/-/m3u8-parser-7.2.0.tgz -> ${P}-npm-62c690c5e1f1267d.tgz
	${NPM_REGISTRY}/magic-string-ast/-/magic-string-ast-1.0.3.tgz -> ${P}-npm-64386977c75a0426.tgz
	${NPM_REGISTRY}/magic-string/-/magic-string-0.30.21.tgz -> ${P}-npm-4f6169695b25027c.tgz
	${NPM_REGISTRY}/mdn-data/-/mdn-data-2.0.28.tgz -> ${P}-npm-e4b711ca681ee1ce.tgz
	${NPM_REGISTRY}/mdn-data/-/mdn-data-2.0.30.tgz -> ${P}-npm-3b8ed4a79dfc3ac1.tgz
	${NPM_REGISTRY}/min-document/-/min-document-2.19.2.tgz -> ${P}-npm-ea0cf2ff7aeb0227.tgz
	${NPM_REGISTRY}/mitt/-/mitt-3.0.1.tgz -> ${P}-npm-e64b14de3ea2b1d3.tgz
	${NPM_REGISTRY}/mlly/-/mlly-1.8.2.tgz -> ${P}-npm-1ddbc10a96b125bd.tgz
	${NPM_REGISTRY}/mpd-parser/-/mpd-parser-1.3.1.tgz -> ${P}-npm-09708f89e55626d6.tgz
	${NPM_REGISTRY}/mrmime/-/mrmime-2.0.1.tgz -> ${P}-npm-72577a5e40557df7.tgz
	${NPM_REGISTRY}/ms/-/ms-2.1.3.tgz -> ${P}-npm-7f1f904879825b70.tgz
	${NPM_REGISTRY}/muggle-string/-/muggle-string-0.4.1.tgz -> ${P}-npm-a50fec1a74040cf8.tgz
	${NPM_REGISTRY}/mux.js/-/mux.js-7.1.0.tgz -> ${P}-npm-4d917ea737b57921.tgz
	${NPM_REGISTRY}/nanoid/-/nanoid-3.3.12.tgz -> ${P}-npm-917501018f381b92.tgz
	${NPM_REGISTRY}/node-releases/-/node-releases-2.0.47.tgz -> ${P}-npm-3ad504abd116d508.tgz
	${NPM_REGISTRY}/nth-check/-/nth-check-2.1.1.tgz -> ${P}-npm-49268634a9d8e979.tgz
	${NPM_REGISTRY}/obug/-/obug-2.1.2.tgz -> ${P}-npm-d50be9d5d7cbe264.tgz
	${NPM_REGISTRY}/ohash/-/ohash-2.0.11.tgz -> ${P}-npm-75cb1717869dd64d.tgz
	${NPM_REGISTRY}/open/-/open-11.0.0.tgz -> ${P}-npm-31c0d5d09ed211a6.tgz
	${NPM_REGISTRY}/pathe/-/pathe-2.0.3.tgz -> ${P}-npm-8c67bf8a52787141.tgz
	${NPM_REGISTRY}/perfect-debounce/-/perfect-debounce-1.0.0.tgz -> ${P}-npm-1db3969b50a785e7.tgz
	${NPM_REGISTRY}/perfect-debounce/-/perfect-debounce-2.1.0.tgz -> ${P}-npm-47a2045d87a17082.tgz
	${NPM_REGISTRY}/picocolors/-/picocolors-1.1.1.tgz -> ${P}-npm-1aabc8b6282461d4.tgz
	${NPM_REGISTRY}/picomatch/-/picomatch-4.0.4.tgz -> ${P}-npm-676c5d666aeb937e.tgz
	${NPM_REGISTRY}/pinia-plugin-persistedstate/-/pinia-plugin-persistedstate-4.7.1.tgz -> ${P}-npm-18f551a2f7680cd6.tgz
	${NPM_REGISTRY}/pinia/-/pinia-3.0.4.tgz -> ${P}-npm-35bce50d5a3ba473.tgz
	${NPM_REGISTRY}/pkcs7/-/pkcs7-1.0.4.tgz -> ${P}-npm-93621b1b8b3ed991.tgz
	${NPM_REGISTRY}/pkg-types/-/pkg-types-1.3.1.tgz -> ${P}-npm-ce52638149de4d94.tgz
	${NPM_REGISTRY}/pkg-types/-/pkg-types-2.3.1.tgz -> ${P}-npm-c91484aad08de0e7.tgz
	${NPM_REGISTRY}/postcss-value-parser/-/postcss-value-parser-4.2.0.tgz -> ${P}-npm-3bfe00d6de888dc0.tgz
	${NPM_REGISTRY}/postcss/-/postcss-8.5.15.tgz -> ${P}-npm-96d7922033e04952.tgz
	${NPM_REGISTRY}/powershell-utils/-/powershell-utils-0.1.0.tgz -> ${P}-npm-0d6b00515f445b77.tgz
	${NPM_REGISTRY}/prettier/-/prettier-3.8.4.tgz -> ${P}-npm-6192ff5b4edf3683.tgz
	${NPM_REGISTRY}/process/-/process-0.11.10.tgz -> ${P}-npm-5d6694e104efc9e7.tgz
	${NPM_REGISTRY}/quansync/-/quansync-0.2.11.tgz -> ${P}-npm-b6d9d1e08938b6a6.tgz
	${NPM_REGISTRY}/readdirp/-/readdirp-5.0.0.tgz -> ${P}-npm-30d02ebc1d23a40d.tgz
	${NPM_REGISTRY}/rfdc/-/rfdc-1.4.1.tgz -> ${P}-npm-6ab2241184da4e31.tgz
	${NPM_REGISTRY}/rolldown/-/rolldown-1.0.3.tgz -> ${P}-npm-988f620d1e317fc5.tgz
	${NPM_REGISTRY}/run-applescript/-/run-applescript-7.1.0.tgz -> ${P}-npm-e87af079f9cfb12f.tgz
	${NPM_REGISTRY}/sax/-/sax-1.6.0.tgz -> ${P}-npm-a7b14f7cc14b5c30.tgz
	${NPM_REGISTRY}/scule/-/scule-1.3.0.tgz -> ${P}-npm-7c66ca2dcfbd9eaf.tgz
	${NPM_REGISTRY}/semver/-/semver-6.3.1.tgz -> ${P}-npm-c11f472dbb89a47a.tgz
	${NPM_REGISTRY}/sirv/-/sirv-3.0.2.tgz -> ${P}-npm-1e9132e4c1660a7a.tgz
	${NPM_REGISTRY}/source-map-js/-/source-map-js-1.2.1.tgz -> ${P}-npm-1f28c3431ddd7e5f.tgz
	${NPM_REGISTRY}/speakingurl/-/speakingurl-14.0.1.tgz -> ${P}-npm-b600e5b1415cb920.tgz
	${NPM_REGISTRY}/superjson/-/superjson-2.2.6.tgz -> ${P}-npm-0fe3200d3c78e9be.tgz
	${NPM_REGISTRY}/svgo/-/svgo-3.3.3.tgz -> ${P}-npm-babf77a207084cb4.tgz
	${NPM_REGISTRY}/tailwindcss/-/tailwindcss-4.3.0.tgz -> ${P}-npm-00d42263e20e6930.tgz
	${NPM_REGISTRY}/tapable/-/tapable-2.3.3.tgz -> ${P}-npm-a3ad811e7540da27.tgz
	${NPM_REGISTRY}/tinyglobby/-/tinyglobby-0.2.17.tgz -> ${P}-npm-58e91972fa4b4a3d.tgz
	${NPM_REGISTRY}/totalist/-/totalist-3.0.1.tgz -> ${P}-npm-0564b381263459ed.tgz
	${NPM_REGISTRY}/tslib/-/tslib-2.8.1.tgz -> ${P}-npm-22c327e2a43612f6.tgz
	${NPM_REGISTRY}/typescript/-/typescript-6.0.3.tgz -> ${P}-npm-f7603f6588bc731c.tgz
	${NPM_REGISTRY}/ufo/-/ufo-1.6.4.tgz -> ${P}-npm-dd91361d8c8d8165.tgz
	${NPM_REGISTRY}/undici-types/-/undici-types-7.24.6.tgz -> ${P}-npm-45ddd8bf6d49fcb7.tgz
	${NPM_REGISTRY}/unplugin-utils/-/unplugin-utils-0.3.1.tgz -> ${P}-npm-477f4876f4c48a13.tgz
	${NPM_REGISTRY}/unplugin/-/unplugin-3.0.0.tgz -> ${P}-npm-0ad18a9006c5e61e.tgz
	${NPM_REGISTRY}/update-browserslist-db/-/update-browserslist-db-1.2.3.tgz -> ${P}-npm-a65925664798d61c.tgz
	${NPM_REGISTRY}/video.js/-/video.js-8.23.7.tgz -> ${P}-npm-c1aff97def875c6d.tgz
	${NPM_REGISTRY}/videojs-contrib-quality-levels/-/videojs-contrib-quality-levels-4.1.0.tgz \
		-> ${P}-npm-45392d6e330887ee.tgz
	${NPM_REGISTRY}/videojs-font/-/videojs-font-4.2.0.tgz -> ${P}-npm-f6906146eeaa2619.tgz
	${NPM_REGISTRY}/videojs-vtt.js/-/videojs-vtt.js-0.15.5.tgz -> ${P}-npm-94e98cb11b2689c8.tgz
	${NPM_REGISTRY}/vite-dev-rpc/-/vite-dev-rpc-2.0.0.tgz -> ${P}-npm-dedc822a9d871e34.tgz
	${NPM_REGISTRY}/vite-hot-client/-/vite-hot-client-2.2.0.tgz -> ${P}-npm-bfbc2d93c4f44d13.tgz
	${NPM_REGISTRY}/vite-plugin-inspect/-/vite-plugin-inspect-11.4.1.tgz -> ${P}-npm-640bfbb984dddd08.tgz
	${NPM_REGISTRY}/vite-plugin-vue-devtools/-/vite-plugin-vue-devtools-8.1.2.tgz -> ${P}-npm-270a98977209ad82.tgz
	${NPM_REGISTRY}/vite-plugin-vue-inspector/-/vite-plugin-vue-inspector-6.0.0.tgz -> ${P}-npm-03714f3d5ce07a16.tgz
	${NPM_REGISTRY}/vite-svg-loader/-/vite-svg-loader-5.1.1.tgz -> ${P}-npm-22ca98b901dc0c55.tgz
	${NPM_REGISTRY}/vite/-/vite-8.0.16.tgz -> ${P}-npm-d0aca41a33655685.tgz
	${NPM_REGISTRY}/vue-draggable-plus/-/vue-draggable-plus-0.6.1.tgz -> ${P}-npm-36d1b495873edf3f.tgz
	${NPM_REGISTRY}/vue-i18n/-/vue-i18n-11.4.5.tgz -> ${P}-npm-e451ec9b7f1689c0.tgz
	${NPM_REGISTRY}/vue-lazyload/-/vue-lazyload-3.0.0.tgz -> ${P}-npm-eac0b509e3c93a1f.tgz
	${NPM_REGISTRY}/vue-router/-/vue-router-5.1.0.tgz -> ${P}-npm-b3dac79b11e13cb1.tgz
	${NPM_REGISTRY}/vue/-/vue-3.5.35.tgz -> ${P}-npm-2d77b8a300bc0fc3.tgz
	${NPM_REGISTRY}/webpack-virtual-modules/-/webpack-virtual-modules-0.6.2.tgz -> ${P}-npm-f668470a677d4afc.tgz
	${NPM_REGISTRY}/wsl-utils/-/wsl-utils-0.3.1.tgz -> ${P}-npm-f21e6663292a883b.tgz
	${NPM_REGISTRY}/yallist/-/yallist-3.1.1.tgz -> ${P}-npm-c9a955b00d0db151.tgz
	${NPM_REGISTRY}/yaml/-/yaml-2.9.0.tgz -> ${P}-npm-4a0ec57d30623e92.tgz
"

DESCRIPTION="Offline-first photo manager with local AI search"
HOMEPAGE="https://github.com/julyx10/lap https://julyx10.github.io/lap/"
SRC_URI="
	https://github.com/julyx10/lap/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/LibRaw/LibRaw/archive/${LIBRAW_COMMIT}.tar.gz -> ${P}-LibRaw.tar.gz
	https://github.com/libjpeg-turbo/libjpeg-turbo/archive/${LIBJPEG_COMMIT}.tar.gz -> ${P}-libjpeg-turbo.tar.gz
	https://github.com/strukturag/libheif/archive/${LIBHEIF_COMMIT}.tar.gz -> ${P}-libheif.tar.gz
	https://github.com/strukturag/libde265/archive/${LIBDE265_COMMIT}.tar.gz -> ${P}-libde265.tar.gz
	https://cdn.pyke.io/0/pyke:ort-rs/ms@1.22.0/x86_64-unknown-linux-gnu.tgz -> ${P}-onnxruntime-amd64.tgz
	ai? (
		${HF_URI}/openai/clip-vit-base-patch32/resolve/${CLIP_COMMIT}/tokenizer.json -> ${P}-tokenizer.json
		${HF_URI}/Xenova/clip-vit-base-patch32/resolve/${XENOVA_COMMIT}/onnx/text_model_quantized.onnx -> ${P}-text_model.onnx
		${HF_URI}/Xenova/clip-vit-base-patch32/resolve/${XENOVA_COMMIT}/onnx/vision_model_quantized.onnx \
		-> ${P}-vision_model.onnx
	)
	face? (
		${HF_URI}/deepghs/insightface/resolve/${INSIGHTFACE_COMMIT}/buffalo_s/det_500m.onnx -> ${P}-det_500m.onnx
		${HF_URI}/deepghs/insightface/resolve/${INSIGHTFACE_COMMIT}/buffalo_s/w600k_mbf.onnx -> ${P}-w600k_mbf.onnx
	)
	${CARGO_CRATE_URIS}
	${NPM_DEPENDENCIES}
"

LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0
	CDLA-Permissive-2.0 ISC MIT MPL-2.0 UoI-NCSA Unicode-3.0 ZLIB
"
# Bundled native libraries, ONNX Runtime, and frontend dependencies.
LICENSE+=" 0BSD BSD IJG LGPL-2.1+ LGPL-3+ MIT BlueOak-1.0.0 CC-BY-4.0 CC0-1.0"
LICENSE+=" face? ( InsightFace-Models )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ai face"
REQUIRED_USE="face? ( ai )"
RESTRICT="face? ( bindist mirror )"

DEPEND="
	dev-libs/glib:2
	dev-libs/openssl:0=
	x11-libs/gtk+:3
	net-libs/libsoup:3.0
	net-libs/webkit-gtk:4.1
	sys-apps/dbus
	virtual/zlib
	x11-libs/gdk-pixbuf:2
	x11-libs/libX11
	x11-misc/xdotool
"
RDEPEND="${DEPEND}
	media-video/ffmpeg
	sys-apps/coreutils
	x11-misc/xdg-utils
"
BDEPEND="
	dev-build/cmake
	dev-lang/nasm
	>=net-libs/nodejs-20.19.0[npm]
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${P}-npm-lock.patch"
	"${FILESDIR}/${P}-portage.patch"
)

pkg_pretend() {
	[[ ${CHOST} == x86_64*-linux-gnu ]] || die "ONNX Runtime requires amd64 Linux with glibc"
}

src_unpack() {
	unpack "${P}.tar.gz" "${P}-LibRaw.tar.gz" \
		"${P}-libjpeg-turbo.tar.gz" "${P}-libheif.tar.gz" \
		"${P}-libde265.tar.gz" "${P}-onnxruntime-amd64.tgz"
	cargo_crate_unpack
	cargo_gen_config

	local third_party="${S}/src-tauri/third_party"
	rmdir "${third_party}/LibRaw" "${third_party}/libjpeg-turbo" \
		"${third_party}/libheif" "${third_party}/libde265" || die
	mv "${WORKDIR}/LibRaw-${LIBRAW_COMMIT}" "${third_party}/LibRaw" || die
	mv "${WORKDIR}/libjpeg-turbo-${LIBJPEG_COMMIT}" "${third_party}/libjpeg-turbo" || die
	mv "${WORKDIR}/libheif-${LIBHEIF_COMMIT}" "${third_party}/libheif" || die
	mv "${WORKDIR}/libde265-${LIBDE265_COMMIT}" "${third_party}/libde265" || die
}

src_prepare() {
	default

	# Populate npm's integrity-addressed cache using only declared distfiles.
	local uri arrow archive
	local -a npm_archives=()
	while read -r uri arrow archive; do
		[[ -n ${archive} ]] && npm_archives+=( "${DISTDIR}/${archive}" )
	done <<< "${NPM_DEPENDENCIES}"
	npm --cache "${T}/npm-cache" cache add "${npm_archives[@]}" || die
}

src_compile() {
	cd "${S}/src-vite" || die
	npm --cache "${T}/npm-cache" ci --offline --ignore-scripts --no-audit --no-fund || die
	npm run build || die

	cd "${S}/src-tauri" || die
	# Upstream uses this pinned static ONNX Runtime archive; do not fetch in build.rs.
	local -x ORT_LIB_LOCATION="${WORKDIR}/onnxruntime/lib"
	local -x ORT_SKIP_DOWNLOAD=1
	cargo_src_compile
}

src_test() {
	cd "${S}/src-tauri" || die
	local -x ORT_LIB_LOCATION="${WORKDIR}/onnxruntime/lib"
	local -x ORT_SKIP_DOWNLOAD=1
	cargo_src_test
}

src_install() {
	cd "${S}/src-tauri" || die
	dobin "$(cargo_target_dir)/Lap"
	dosym Lap /usr/bin/${PN}

	newicon -s 512 icons/icon.png ${PN}.png
	make_desktop_entry Lap Lap ${PN} Graphics

	local model
	if use ai; then
		insinto /usr/share/${PN}/models
		for model in tokenizer.json text_model.onnx vision_model.onnx; do
			newins "${DISTDIR}/${P}-${model}" "${model}"
		done
	fi
	if use face; then
		for model in det_500m.onnx w600k_mbf.onnx; do
			newins "${DISTDIR}/${P}-${model}" "${model}"
		done
	fi
	# Tauri resolves Linux resources relative to /usr/lib/<executable>.
	if use ai; then
		dosym -r /usr/share/${PN}/models /usr/lib/Lap/models
	fi

	cd "${S}" || die
	dodoc README.md THIRD_PARTY_NOTICES.txt
}

QA_FLAGS_IGNORED="usr/bin/Lap"
