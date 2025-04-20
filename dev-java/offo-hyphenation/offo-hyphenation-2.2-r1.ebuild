# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Hyphenation patterns for Apache Fop"
HOMEPAGE="http://offo.sourceforge.net"
SRC_URI="https://sourceforge.net/projects/offo/files/offo-hyphenation/${PV}/offo-hyphenation.zip -> ${P}.zip"

S="${WORKDIR}/${PN}"
LICENSE="GPL-2 Apache-2.0 TeX"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND="app-arch/unzip"

src_compile() { :; }

src_install() {
	insinto /usr/share/${PN}/
	doins -r hyph

	if use doc; then
		dodoc -r images skin *.html
	fi
}

pkg_postinst() {
	elog "This package installs hyphenation files for several languages"
	elog "into /usr/share/${PN}/hyph"
	ewarn "If fop supports this ebuild, then emerge -1 fop with the hyphenation use flag set (if available)"
	ewarn "The fop compilation creates fop-hyph.jar that contains the hyphenation patterns"
	ewarn "aunpack -l /usr/share/fop/lib/fop-hyph.jar shows what hyphenation patterns are available"
}
