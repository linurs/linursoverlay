# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="modpoll a modbus command line utility"
HOMEPAGE="https://www.modbusdriver.com/modpoll.html"
SRC_URI="https://www.modbusdriver.com/downloads/modpoll.tgz"

S="${WORKDIR}/modpoll"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64  ~arm ~arm64 ~x86"
RESTRICT="mirror strip"

src_install() {

	local bindir=""
	local base=${PN%-bin}

	case ${ARCH} in
		amd64)
			bindir="x86_64-linux-gnu"
			;;
		x86)
			bindir="i686-linux-gnu"
			;;
		arm)
			# Generic ARM fallback (Raspberry Pi older 32-bit)
			bindir="arm-linux-gnueabihf"
			;;
		arm64|aarch64)
			bindir="aarch64-linux-gnu"
			;;
		*)
			die "Unsupported architecture: ${ARCH}"
			;;
	esac

	# Verify binary exists
	[[ -x ${S}/${bindir}/modpoll ]] || die "Missing binary for ${ARCH} in ${bindir}/"

	# Install binary under /opt/modpoll-bin-${PV}
	insinto /opt/${PN}-bin-${PV}
	doins "${bindir}/modpoll" || die
	fperms 0755 /opt/${PN}-bin-${PV}/modpoll

	# Create symlink in /usr/bin (per Gentoo policy)
	dosym ../../opt/${PN}-bin-${PV}/modpoll /usr/bin/${base}
	# Install documentation
	dodoc LICENSE-FREE.txt LICENSE-FREE.pdf README.txt README.pdf
}
