# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..14} )
DISTUTILS_USE_PEP517=flit
inherit distutils-r1 desktop git-r3

DESCRIPTION="gui for tkgocryptfs"
HOMEPAGE="https://github.com/linurs/tkgocryptfs"
EGIT_REPO_URI="https://github.com/linurs/tkgocryptfs.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
RESTRICT="mirror"   # do not try to fetch from gentoo mirrors

DOCS=( README.md )

DEPEND="
	dev-python/pexpect
	app-crypt/gocryptfs
"
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install

	# Add the files from outside the python whl package
	doicon "${S}"/share/icons/hicolor/48x48/apps/tkgocryptfs.png
	domenu "${S}"/share/applications/tkgocryptfs.desktop
	doman  "${S}"/share/man/man1/tkgocryptfs.1
}
