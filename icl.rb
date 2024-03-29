class Icl < Formula
  desc "Image Component Library"
  homepage "http://www.iclcv.org"
  version "10.0.2"
  url "https://github.com/iclcv/icl/archive/10.0.2.tar.gz"
  head "https://github.com/iclcv/icl.git"
  sha256 "c5e4c768fecd18bd5c0ccfde6c1583818c66b2d79befcf2d27d2f0074214826d"
  option "with-extra", "additional functionality based on rsb, protobuf, freenect, pcl and bullet"
  option "with-full", "extra features plus libusb, zmq and openni support"

  # # not in homebrew
  # -DBUILD_WITH_XINE=On
  # -DBUILD_WITH_V4L=On
  # -DBUILD_WITH_IPP=On
  # -DBUILD_WITH_MKL=On
  # -DBUILD_WITH_MESASR=On
  # -DBUILD_WITH_PYLON=On
  # -DBUILD_WITH_XIAPI=On
  # -DBUILD_WITH_LIBIRIMAGER=On
  # -DBUILD_WITH_LIBUDEV=On
  # -DBUILD_WITH_RST=On
  # -DBUILD_WITH_LIBFREENECT2=On
  # -DBUILD_WITH_OPENCL=On # apple does not distribute

  depends_on "cmake" => :build
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "qt5"
  depends_on "opencv@3" => "with-ffmpeg"
  depends_on "glew"
  depends_on "libav"
  depends_on "libdc1394"
  depends_on "imagemagick@6"

  #depends_on "boost" if build.with?('extra') or build.with?('full')
  depends_on "protobuf" if build.with?('extra') or build.with?('full')
  depends_on "corlab/formulas/rsb" if build.with?('extra') or build.with?('full')
  depends_on "libfreenect" if build.with?('extra') or build.with?('full')
  depends_on "pcl" if build.with?('extra') or build.with?('full')
  depends_on "bullet" => "with-shared" if build.with?('extra') or build.with?('full')

  depends_on "libusb-compat" if build.with?('full')
  depends_on "iclcv/formulas/cppzmq" if build.with?('full')
  depends_on "homebrew/science/openni" if build.with?('full')

  #depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    args = std_cmake_args
    # we have to work around the cellar structure and the plugin load path here
    args.reject{ |item| item =~ /CMAKE_INSTALL_PREFIX/i}
    args = args + %W[
      -DBUILD_APPS=On
      -DBUILD_DEMOS=On
      -DBUILD_EXAMPLES=On
      -DCMAKE_INSTALL_PREFIX='#{HOMEBREW_PREFIX}'
    ]

    # base features
    args = args + %W[
      -DBUILD_WITH_OPENCV=On
      -DOPENCV_ROOT='#{HOMEBREW_PREFIX}/opt/opencv\@3/share/OpenCV/'
      -DBUILD_WITH_QT=On
      -DQT_ROOT='#{HOMEBREW_PREFIX}/opt/qt5'
      -DBUILD_WITH_OPENGL=On
      -DBUILD_WITH_IMAGEMAGICK=On
      -DBUILD_WITH_LIBAV=On
      -DBUILD_WITH_LIBDC=On
      -DBUILD_WITH_EIGEN3=On
    ]

    # extra features
    if build.with?('extra') or build.with?('full')
      args = args + %W[
        -DBUILD_WITH_RSB=On
        -DBUILD_WITH_RSC=On
        -DBUILD_WITH_PROTOBUF=On
        -DBUILD_WITH_PCL=On
        -DBUILD_WITH_BULLET=On
        -DBUILD_WITH_LIBFREENECT=On
      ]
    end



    # full features
    if build.with?('full')
      args = args + %W[
      -DBUILD_WITH_LIBUSB=On
      -DBUILD_WITH_ZMQ=On
      -DBUILD_WITH_OPENNI=On
      ]
    end
    system "cmake", ".", *args
    system "make DESTDIR=#{prefix} install"
    mv Dir["#{prefix}/usr/local/*"], "#{prefix}"
  end

  test do
    system "icl-viewer -i cvcam 0"
  end
end
