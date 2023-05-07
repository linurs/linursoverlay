# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..11} )
inherit distutils-r1

DESCRIPTION="MariaDB Connector/Python"
HOMEPAGE="https://pypi.org/project/mariadb/"

SRC_URI="
https://files.pythonhosted.org/packages/59/46/a8ccc82fdc3de0ef5a6b31e9678fbc9301cb460957e2c94c1d02fd2c4ea4/mariadb-1.1.2.tar.gz
"



LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-db/mariadb-connector-c"
