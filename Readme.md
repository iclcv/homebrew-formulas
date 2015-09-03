# Image Component Library

ICL is a novel C++ computer-vision library developed in the neuroinformatics group of the university of Bielefeld and in CITEC. It unifies both, performance and user friendliness. ICL provides a large set of simple-to-use classes and functions to facilitate development of complex computer vision applications.

homepage: http://www.iclcv.org
code: https://opensource.cit-ec.de/projects/icl

## Installation

### Prerequisite

Tab the required repository.

```bash
brew tap iclcv/formulas
```

### Basic Installation

The basic installation includes Qt5, OpenCV, ImageMagick, LibAV and Firewire (DC1394) support.

```bash
brew install icl
```

### Extended Features

Extends the basic feature set with bindings and wrappers for libfreenect, RSB, Bullet and PCL.

```bash
brew install icl --with-extra
```

### All Available Features

Includes all the above mentioned features plus zmq, OpenNI and support for additional USB devices.

```bash
brew install icl --with-full
```

### Test

```bash
brew test icl
```
