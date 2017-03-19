
class Newmat < Formula
  desc "Matrix library"
  homepage "http://www.robertnz.net/"
  url "http://www.robertnz.net/ftp/newmat10.tar.gz"
  sha256 "637d18c0363b8bb99c48eb04cce8c182ccbff771df0bf1e2d541e95f6eb34e7b"

  def install
    system "make", "PREFIX=#{prefix}", "-f", "nm_cc.mak"
    system "make", "PREFIX=#{prefix}", "-f", "nm_cc.mak", "install"
  end

  patch :DATA
end
__END__
diff --git a/include.h b/include.h
index 952ba7b..6f2c315 100644
--- a/include.h
+++ b/include.h
@@ -7,7 +7,7 @@
 #ifndef INCLUDE_LIB
 #define INCLUDE_LIB
 
-//#define use_namespace                   // define name spaces
+#define use_namespace                   // define name spaces
 
 //#define SETUP_C_SUBSCRIPTS              // allow element access via A[i][j]
 
diff --git a/nm_cc.mak b/nm_cc.mak
index 737e3d7..17b07f3 100644
--- a/nm_cc.mak
+++ b/nm_cc.mak
@@ -1,4 +1,4 @@
-CXX = CC
+CXX = c++
 CXXFLAGS = -O2
 
 DIFF = ./sdiff
@@ -180,3 +180,9 @@ garch.txx:     	garch
 		$(PRE)garch > garch.txx
 		$(DIFF) garch.txt garch.txx
 
+install: everything
+		mkdir $(PREFIX)/lib
+		cp libnewmat.a $(PREFIX)/lib/
+		mkdir -p $(PREFIX)/include/newmat
+		cp *.h $(PREFIX)/include/newmat/
+

