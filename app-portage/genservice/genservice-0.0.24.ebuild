# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_{13..14} )
DISTUTILS_USE_PEP517=no
inherit distutils-r1

DESCRIPTION="Genservice: Simple tool for everyday emerge commands."
HOMEPAGE="https://www.linurs.org"
SRC_URI="https://www.linurs.org/download/${P}-py2.py3-none-any.whl -> ${P}.whl"

S="${WORKDIR}"
LICENSE="GPL-3+"
SLOT="0"

KEYWORDS="~amd64"
RESTRICT="mirror"   # do not first try to fetch from gentoo mirrors

DEPEND="
>=app-portage/gentoolkit-0.2.4.5
>=dev-python/pylinurs-0.3
"

src_unpack() {
	cd "${S}" || die
	unzip "${DISTDIR}/${P}.whl" || die
}

src_prepare() {
	default
}

src_install() {
	python_foreach_impl python_install
}

python_install() {
	local site="$(python_get_sitedir)"
	insinto "${site}"
	doins -r *

	# Install man page from the wheel
	doman "${WORKDIR}/${P}.data/data/share/man/man1/genservice.1" || die

	insinto /etc/genservice
	doins genservice/genservice_def.py

	# Install console script manually
	newbin - genservice <<'EOF'
#!/usr/bin/env python3
import sys
from genservice.main import main
if __name__ == '__main__':
	sys.exit(main())
EOF

	fperms +x /usr/bin/genservice

}

pkg_postinst() {
	echo
	einfo "Please edit /etc/genservice/genservice_def.py"
}
