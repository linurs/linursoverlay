# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Eselect module for managing the default terminal emulator"
HOMEPAGE="https://github.com/gentoo"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="app-admin/eselect"
S="${WORKDIR}"
src_install() {
	insinto /usr/share/eselect/modules
	newins "${FILESDIR}/terminal.eselect" terminal.eselect
}
