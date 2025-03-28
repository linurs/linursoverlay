# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="GALasm assembler for GAL Programmable Logic Devices"
HOMEPAGE="https://github.com/daveho/GALasm"
# rename the downloaded file to get an unique name
SRC_URI="https://github.com/daveho/GALasm/archive/master.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_unpack() {
	unpack ${A}
	einfo "rename GALasm-master directory to galasm-2.1";
	mv "${WORKDIR}"/GALasm-master "${WORKDIR}"/galasm-2.1
	cd "${S}"
}

src_compile() {
	cd src || die
	emake
}

src_install() {
	dobin src/galasm
	einstalldocs
}
