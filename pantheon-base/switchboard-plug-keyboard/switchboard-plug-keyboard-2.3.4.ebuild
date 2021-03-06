# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

VALA_MIN_API_VERSION=0.22

inherit meson vala

DESCRIPTION="Adjust keyboard settings from Switchboard"
HOMEPAGE="https://github.com/elementary/switchboard-plug-keyboard"
SRC_URI="https://github.com/elementary/switchboard-plug-keyboard/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls"

RDEPEND="
	dev-libs/glib:2
	dev-libs/granite
	dev-libs/libxml2
	gnome-base/libgnomekbd
	pantheon-base/switchboard
	x11-libs/gtk+:3
	x11-libs/libxklavier
"
DEPEND="${RDEPEND}
	$(vala_depend)
	nls? ( sys-devel/gettext )
	virtual/pkgconfig
"

src_prepare() {
	eapply_user
	epatch "${FILESDIR}/switchboard-plug-keyboard-2.3.4-schema.patch"
	vala_src_prepare
}
