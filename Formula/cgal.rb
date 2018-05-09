class Cgal < Formula
  desc "Computational Geometry Algorithm Library"
  homepage "https://www.cgal.org/"
  url "https://github.com/CGAL/cgal/releases/download/releases/CGAL-4.12/CGAL-4.12.tar.xz"
  sha256 "442ef4fffb2ad6e4141e5a7902993ae6a4e73f7cb641fae1010bb586f6ca5e3f"

  option "with-eigen", "Build with Eigen3 support"
  option "with-lapack", "Build with LAPACK support"
  option "with-qt", "Build ImageIO and Qt components of CGAL"

  deprecated_option "imaging" => "with-qt"
  deprecated_option "with-imaging" => "with-qt"
  deprecated_option "with-eigen3" => "with-eigen"
  deprecated_option "with-qt5" => "with-qt"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "gmp"
  depends_on "mpfr"
  depends_on "qt" => :optional
  depends_on "eigen" => :optional

  def install
    args = std_cmake_args + %W[
      -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
      -DCMAKE_INSTALL_NAME_DIR=#{HOMEBREW_PREFIX}/lib
    ]

    if build.without? "qt"
      args << "-DWITH_CGAL_Qt5=OFF" << "-DWITH_CGAL_ImageIO=OFF"
    else
      args << "-DWITH_CGAL_Qt5=ON" << "-DWITH_CGAL_ImageIO=ON"
    end

    if build.with? "eigen"
      args << "-DWITH_Eigen3=ON"
    else
      args << "-DWITH_Eigen3=OFF"
    end

    if build.with? "lapack"
      args << "-DWITH_LAPACK=ON"
    else
      args << "-DWITH_LAPACK=OFF"
    end

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # https://doc.cgal.org/latest/Algebraic_foundations/Algebraic_foundations_2interoperable_8cpp-example.html
    (testpath/"surprise.cpp").write <<~EOS
      #include <CGAL/basic.h>
      #include <CGAL/Coercion_traits.h>
      #include <CGAL/IO/io.h>
      template <typename A, typename B>
      typename CGAL::Coercion_traits<A,B>::Type
      binary_func(const A& a , const B& b){
          typedef CGAL::Coercion_traits<A,B> CT;
          CGAL_static_assertion((CT::Are_explicit_interoperable::value));
          typename CT::Cast cast;
          return cast(a)*cast(b);
      }
      int main(){
          std::cout<< binary_func(double(3), int(5)) << std::endl;
          std::cout<< binary_func(int(3), double(5)) << std::endl;
          return 0;
      }
    EOS
    system ENV.cxx, "-I#{include}", "-L#{lib}", "-lCGAL",
                    "surprise.cpp", "-o", "test"
    assert_equal "15\n15", shell_output("./test").chomp
  end
end

