# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="MariaDB Connector/Python"
HOMEPAGE="https://pypi.org/project/mariadb/"

SRC_URI="
https://files.pythonhosted.org/packages/e5/30/e80702b8e9eecaddfb510a34d16dec0150d0661b07bb49fd6f55fa18781f/mariadb-1.0.8.zip
"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-db/mariadb-connector-c"
