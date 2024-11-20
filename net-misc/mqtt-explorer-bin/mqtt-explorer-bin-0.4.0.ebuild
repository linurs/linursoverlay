EAPI=8

DESCRIPTION="A binary package installed from a mqtt exploroer Debian .deb file"
HOMEPAGE="https://mqtt-explorer.com/"
# SRC_URI="https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v0.4.0-beta.6/MQTT-Explorer_0.4.0-beta.6_amd64.deb"
SRC_URI="https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v${PV}-beta.6/MQTT-Explorer_${PV}-beta.6_amd64.deb"
LICENSE="MIT"  # Replace with the actual license
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-arch/dpkg"

src_unpack() {
	mkdir "${S}" || die
	cd "${S}" || die
	dpkg-deb -x "${DISTDIR}/${A}" . || die
}

src_install() {

	cd "${S}" || die

	mkdir "${D}"/usr
	cp -r usr/* "${D}/usr/" || die
	# Do not install zipped doc
	if [ -d "${D}/usr/share/doc/mqtt-explorer" ]; then
		find "${D}/usr/share/doc/mqtt-explorer" -name "*.gz" -exec gunzip {} + || die
		dodoc -r "${D}/usr/share/doc/mqtt-explorer"/* || die
		rm -r "${D}/usr/share/doc/mqtt-explorer" || die
	fi
	# Fix the icon path
	if [ -f "${D}/usr/share/icons/hicolor/0x0/apps/mqtt-explorer.png" ]; then
		dodir /usr/share/icons/hicolor/512x512/apps
		mv "${D}/usr/share/icons/hicolor/0x0/apps/mqtt-explorer.png" \
		"${D}/usr/share/icons/hicolor/512x512/apps/" || die
		rmdir "${D}/usr/share/icons/hicolor/0x0/apps" || die
	fi

	mkdir "${D}"/opt

	cp -r opt/* "${D}/opt/" || die
}
