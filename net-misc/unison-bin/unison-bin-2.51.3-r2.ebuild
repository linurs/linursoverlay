# Copyright 2020 linurs.org
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
inherit eutils 
DESCRIPTION="unison binary"
HOMEPAGE="https://www.cis.upenn.edu/~bcpierce/unison/"

KEYWORDS="~amd64"

SRC_URI="https://github.com/bcpierce00/unison/releases/download/v2.51.3/unison-v2.51.3+ocaml-4.11.1+x86_64.linux.tar.gz"

LICENSE="GPL-3"

pkg_name="unison"

SLOT="0"

IUSE=""

RDEPEND=""
DEPEND=""

src_unpack(){
  if [ "${A}" != "" ]; then
     einfo "unpack ${A}"
     unpack ${A}
     mkdir ${WORKDIR}/${P} 
     mv ${WORKDIR}/bin ${WORKDIR}/${P}/bin 
     mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}/LICENSE
     mv ${WORKDIR}/README.md ${WORKDIR}/${P}/README.md
  fi

#  einfo "P=${P}" 
#  einfo "PN=${PN}" 
#  einfo "PV=${PV}" 
#  einfo "PR=${PR}" 
#  einfo "A=${A}" 
#  einfo "D=${D}" 
#  einfo "S=${S}" 
#  einfo "WORKDIR=${WORKDIR}"
#  einfo "FILESDIR=${FILESDIR}"
}

src_install() {
  dodir /opt/${P}
  cp -r ${S} ${D}opt || die	
  
  einfo "Add an picture to the icons"
  doicon ${FILESDIR}/${PN}.png

  einfo "Do the desktop file" 
  make_desktop_entry /opt/${P}/bin/unison-gtk2 ${PN} ${PN} System  
}

