# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Textbox < Formula
  desc ""
  homepage ""
  url "https://github.com/ulucs/textbox/archive/v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "d1bb1498e03921abe99c4c10fd9ca40aab707a8d8e20c690c992a3c694f9e1b4"

  depends_on "cmake"
  depends_on "imagemagick" => 'with-ghostscript'
  depends_on "ghostscript"
  depends_on "tesseract"
  depends_on "homebrew/science/opencv" => 'without-python'

  # depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    # system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
    system "./install.sh"
    prefix.install Dir["*"]
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test textbox`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "echo", "0"
  end
end
