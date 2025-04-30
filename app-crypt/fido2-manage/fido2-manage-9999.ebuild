# Copyright 2025
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3 xdg-utils desktop

DESCRIPTION="Token2 fido2-manage tool"
HOMEPAGE="https://github.com/Token2/fido2-manage"
EGIT_REPO_URI="https://github.com/Token2/fido2-manage.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="smartcard"

DEPEND="
	smartcard? (
		sys-apps/pcsc-lite
	)
	app-eselect/eselect-terminal
	x11-terms/x-terminal-emulator
	dev-util/desktop-file-utils
"

RDEPEND="${DEPEND}"

src_prepare(){
	default
	# add the missing shebang
	sed -i '1i#!/usr/bin/python3' "${S}/gui.py" || die "Failed to add Python shebang"
	# remove ./ from the path so it can be called from everywhere
	sed -i "s/FIDO_COMMAND = '.\/fido2-manage.sh'/FIDO_COMMAND = 'fido2-manage.sh'/" "${WORKDIR}/${P}/gui.py"
}

src_configure() {
	rm -rf build || die
	mkdir build || die
	cd build || die
	cmake .. -DUSE_PCSC=$(usex smartcard) || die
	# cmake .. -DUSE_PCSC=ON || die
}

src_compile() {
	emake -C build
}

src_install() {
	emake -C build install DESTDIR="${D}"

	# Rename and install the gui.py file
	newbin "${WORKDIR}/${P}/gui.py" fido2-manage.py

	# Install the shell script with executable permission
	exeinto /usr/bin
	doexe "${WORKDIR}/${P}/fido2-manage.sh"

	# Validate & install .desktop file
	desktop-file-validate "${FILESDIR}/fido2-manage.desktop" || die "Desktop file validation failed"
	einstalldocs
	domenu "${FILESDIR}/fido2-manage.desktop"

	# Install PNG icon (32x32)
	insinto /usr/share/icons/hicolor/48x48/apps
	doins "${FILESDIR}/token2.png"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
