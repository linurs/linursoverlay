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
	einfo "S=${S}"
	cd "${S}" || die

        einfo "D=${D}"
        mkdir ${D}/usr
        mkdir ${D}/opt        
	cp -r usr/* "${D}/usr/" || die
	cp -r opt/* "${D}/opt/" || die
}
