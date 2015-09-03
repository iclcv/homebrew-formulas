# Image Component Library

ICL is a novel C++ computer-vision library developed in the neuroinformatics group of the university of Bielefeld and in CITEC. It unifies both, performance and user friendliness. ICL provides a large set of simple-to-use classes and functions to facilitate development of complex computer vision applications.

homepage: http://www.iclcv.org

code: https://opensource.cit-ec.de/projects/icl

## Installation

The instructions focus exclusively on installation via Homebrew on OSX. For instructions on how to build ICL from source for Linux and Windows, please refere to the [project pages](https://opensource.cit-ec.de/projects/icl).

### Prerequisite

Tab the required repository.

```bash
brew tap iclcv/formulas
```

After this you can continue with _either_ the basic, extended or the full installation instructions.

### Basic Installation

The basic installation includes [Qt5](http://doc.qt.io/qt-5), [OpenCV](http://opencv.org), [ImageMagick](http://www.imagemagick.org), [Libav](https://libav.org/) and [Firewire (Camera)](https://en.wikipedia.org/wiki/IEEE_1394) support.

```bash
brew install icl
```

### Extended Features

Extends the basic feature set with bindings and wrappers for [libfreenect](http://openkinect.org/), [RSB](https://code.cor-lab.org/projects/rsb), [Bullet](http://bulletphysics.org) and [PCL](http://pointclouds.org).

```bash
brew install icl --with-extra
```

### All Available Features

Includes all the above mentioned features plus [0MQ](http://zeromq.org), [OpenNI](https://github.com/OpenNI/OpenNI) and support for additional USB devices.

```bash
brew install icl --with-full
```

### Test

```bash
brew test icl
```
