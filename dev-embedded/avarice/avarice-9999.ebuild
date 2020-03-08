# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils subversion

DESCRIPTION="Interface for GDB to Atmel AVR JTAGICE in circuit emulator"
HOMEPAGE="http://avarice.sourceforge.net/"
#ESVN_REPO_URI="https://svn.code.sf.net/p/avarice/code/trunk"

ESVN_REPO_URI="svn://svn.code.sf.net/p/avarice/code/trunk"

#ESVN_PROJECT="avarice-code"
# "svn checkout https://svn.code.sf.net/p/avarice/code/trunk avarice-code"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# build dependency
DEPEND=">=dev-vcs/subversion-1.12.2"

src_prepare() {
  einfo "P=${P}" 
  einfo "PN=${PN}" 
  einfo "PV=${PV}" 
  einfo "PR=${PR}" 
  einfo "A=${A}" 
  einfo "D=${D}" 
  einfo "S=${S}" 
  einfo "WORKDIR=${WORKDIR}"
  einfo "FILESDIR=${FILESDIR}"
  
  # have the source there where it has to be
  mv ${WORKDIR}/${P}/${PN}/* ${WORKDIR}/${P}
  
  cd ${WORKDIR}/${P}
  einfo "Run Bootstrap"
  ./Bootstrap
  einfo "Bootstrap ended"
}
