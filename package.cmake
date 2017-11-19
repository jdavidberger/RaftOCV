SET(CGET_CONFIG_SHARED_BIN_DIR OFF)

include(${CGET_CORE_DIR}.cget/core.cmake)

set(CGET_ALLOW_SYSTEM ON)

CGET_HAS_DEPENDENCY(OpenCV GITHUB opencv/opencv VERSION 3.3.1
        NO_FIND_PACKAGE
        OPTIONS
        -DENABLE_PRECOMPILED_HEADERS:BOOL=OFF
        -DBUILD_WITH_STATIC_CRT:BOOL=OFF
        -DBUILD_opencv_java:BOOL=OFF
        -DBUILD_opencv_calib3d:BOOL=ON
        -DBUILD_opencv_videoio:BOOL=ON
        -DBUILD_opencv_video:BOOL=ON
        -DBUILD_opencv_highgui:BOOL=ON
        -DBUILD_opencv_python:BOOL=OFF
        -DBUILD_opencv_python2:BOOL=OFF
        -DBUILD_opencv_python3:BOOL=OFF
        -DBUILD_FAT_JAVA_LIB:BOOL=OFF
        -DBUILD_TESTS:BOOL=OFF
        -DBUILD_PERF_TESTS:BOOL=OFF
        -DBUILD_PACKAGE:BOOL=OFF
        -DBUILD_DOCS:BOOL=OFF
        -DBUILD_opencv_apps:BOOL=OFF
        -BUILD_SHARED_LIBS:BOOL=ON
        -DANDROID:BOOL=OFF
        -DWITH_VTK:BOOL=OFF
        -DWITH_WIN32UI:BOOL=OFF
        -DWITH_QT:BOOL=ON
        -DWITH_CUDA:BOOL=ON
        -DWITH_CUFFT:BOOL=ON
        -DWITH_CUBLAS:BOOL=ON
        -DCUDA_ARCH_BIN="3.5 6.1"
        -DCUDA_HOST_COMPILER=/usr/bin/gcc-6
        -DCUDA_NVCC_FLAGS=--expt-relaxed-constexpr
        -DCUDA_GENERATION:STRING=Pascal
        -DBUILD_ZLIB:BOOL=OFF )

CGET_HAS_DEPENDENCY(QThread GITHUB Qthreads/qthreads NO_FIND_PACKAGE)
CGET_HAS_DEPENDENCY(Caffe GITHUB BVLC/caffe VERSION 1.0 OPTIONS -DUSE_CUDNN=OFF -DCUDA_HOST_COMPILER=/usr/bin/gcc-6 -DCUDA_ARCH_NAME=Pascal)
CGET_HAS_DEPENDENCY(OpenPose GITHUB CMU-Perceptual-Computing-Lab/openpose OPTIONS -DUSE_CUDNN=OFF -DCUDA_HOST_COMPILER=/usr/bin/gcc-6 -DCUDA_ARCH=Pascal -DBUILD_CAFFE=OFF)


list(APPEND CMAKE_INCLUDE_PATH "${CGET_INSTALL_DIR}/include/qthread")
CGET_WRITE_CGET_SETTINGS_FILE()

CGET_HAS_DEPENDENCY(QtPropertyBrowser GITHUB intbots/QtPropertyBrowser COMMIT 5ca603a)
CGET_HAS_DEPENDENCY(RaftLib GITHUB RaftLib/RaftLib NO_FIND_PACKAGE COMMIT ff595744ebfed0dc25089f970bedc8b884bef748)# OPTIONS -DUSEQTHREAD=1)
#CGET_HAS_DEPENDENCY(PCL GITHUB PointCloudLibrary/pcl)