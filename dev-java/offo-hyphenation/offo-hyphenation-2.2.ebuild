# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Hyphenation patterns for Apache Fop"
HOMEPAGE="http://offo.sourceforge.net"
#SRC_URI="mirror://sourceforge/offo/${PN}_v${PV}.zip"
SRC_URI="https://sourceforge.net/projects/offo/files/offo-hyphenation/2.2/offo-hyphenation.zip"


LICENSE="GPL-2 Apache-2.0 LPPL-1.3b TeX"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=""
DEPEND="app-arch/unzip"

S="${WORKDIR}/${PN}"

src_compile() { :; }

src_install() {
	dodir /usr/share/${PN}/
	insinto /usr/share/${PN}/
	doins -r hyph

	if use doc; then
		dohtml -r images skin i*.html
	fi
}

pkg_postinst() {
	elog "This package installs hyphenation files for several languages"
	elog "into /usr/share/${PN}/hyph"
        ewarn "If fop supports this ebuild, then emerge -1 fop with the hyphenation use flag set (if available)"
        ewarn "The fop compilation creates fop-hyph.jar that contains the hyphenation patterns" 
        ewarn "aunpack -l /usr/share/fop/lib/fop-hyph.jar shows what hyphenation patterns are available" 
}
