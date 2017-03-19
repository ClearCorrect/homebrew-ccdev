class Mxe < Formula
  desc "M cross environment"
  homepage "http://mxe.cc"
  head "https://github.com/mxe/mxe.git"

  keg_only "Has to be this way"

	depends_on "autoconf" => :build
	depends_on "automake" => :build
	depends_on "coreutils" => :build
	depends_on "gdk-pixbuf" => :build
	depends_on "gettext" => :build
	depends_on "gnu-sed" => :build
	depends_on "gnu-tar" => :build
	depends_on "intltool" => :build
	depends_on "libtool" => :build
	depends_on "p7zip" => :build
	depends_on "wget" => :build
	depends_on "xz" => :build
	depends_on "scons" => :build

  def install
		system "unset", "CFLAGS"
		system "unset", "CXXFLAGS"
		system "unset", "CC"
		system "unset", "CXX"
		system "unset", "OBJCXXFLAGS"
		system "unset", "OBJC"
		system "unset", "OBJCXX"
		system "unset", "LDFLAGS"
		system "unset", "CPPFLAGS"
		system "unset", "MAKEFLAGS"
		system "unset", "PKG_CONFIG_LIBDIR"
		system "unset", "CMAKE_PREFIX_PATH"
		system "unset", "CMAKE_FRAMEWORK_PATH"
    system "make", "MXE_TARGETS=x86_64-w64-mingw32.static", "qt5", "QT5_BUILD_TYPE=-debug-and-release"
  end
end
