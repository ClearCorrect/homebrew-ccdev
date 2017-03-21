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
		system "env", "-u", "CFLAGS", "-u", "CXXFLAGS", "-u", "CC", "-u", "CXX", "-u", "OBJCXXFLAGS", "-u", "OBJC", "-u", "OBJCXX", "-u", "LDFLAGS", "-u", "CPPFLAGS", "-u", "MAKEFLAGS", "-u", "PKG_CONFIG_LIBDIR", "-u", "CMAKE_PREFIX_PATH", "-u", "CMAKE_FRAMEWORK_PATH", "make", "MXE_TARGETS=x86_64-w64-mingw32.static", "QT5_BUILD_TYPE=-debug-and-release"
  end
end
