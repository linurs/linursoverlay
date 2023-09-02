# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit subversion

DESCRIPTION="Interface for GDB to Atmel AVR JTAGICE in circuit emulator"
HOMEPAGE="http://avarice.sourceforge.net/"

ESVN_REPO_URI="svn://svn.code.sf.net/p/avarice/code/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-vcs/subversion-1.12.2"

src_prepare() {
	mv "${WORKDIR}"/"${P}"/"${PN}"/* "${WORKDIR}"/"${P}"

	cd "${WORKDIR}"/"${P}"
	einfo "Run Bootstrap"
	./Bootstrap
	einfo "Bootstrap ended"
	eapply_user
}
