### Opencv C++ with XCode

>opencv installed with home brew

#### Get the list of all the dylib's

```bash
$ pkg-config --cflags --libs /usr/local/opt/opencv3/lib/pkgconfig/opencv.pc

$ for i in `pkg-config --cflags --libs /usr/local/opt/opencv3/lib/pkgconfig/opencv.pc`;do echo $i; done
-I/usr/local/Cellar/opencv3/HEAD-7dd3723_4/include/opencv
-I/usr/local/Cellar/opencv3/HEAD-7dd3723_4/include
-L/usr/local/Cellar/opencv3/HEAD-7dd3723_4/lib
-lopencv_stitching
-lopencv_superres
-lopencv_videostab
-lopencv_aruco
-lopencv_bgsegm
-lopencv_bioinspired
-lopencv_ccalib
-lopencv_dpm
-lopencv_fuzzy
-lopencv_line_descriptor
-lopencv_optflow
-lopencv_reg
-lopencv_saliency
-lopencv_stereo
-lopencv_structured_light
-lopencv_phase_unwrapping
-lopencv_rgbd
-lopencv_surface_matching
-lopencv_tracking
-lopencv_datasets
-lopencv_text
-lopencv_face
-lopencv_plot
-lopencv_dnn
-lopencv_xfeatures2d
-lopencv_shape
-lopencv_video
-lopencv_ximgproc
-lopencv_calib3d
-lopencv_features2d
-lopencv_flann
-lopencv_xobjdetect
-lopencv_objdetect
-lopencv_ml
-lopencv_xphoto
-lopencv_highgui
-lopencv_videoio
-lopencv_imgcodecs
-lopencv_photo
-lopencv_imgproc
-lopencv_core
```

#### Project setup in XCode

- Create New Project
- File > New Project > (mac OS) Command Line Tool
- Next > Choose C++ project

#### Project specific settings

- Build Settings | Build Options | Build Rules
- At the top, select Build Settings and search for Search Paths
- Change the Always Search User Paths to true.
- Change the Header Search Paths to usr/local/include.
- Change Library Search Paths to usr/local/lib.
- In the search field, remove your previous search and scroll down until you find the Linking section.
- Double click on Other Linker Flags, click on the + button and add the list of libraries lopencv* obtained from running `pkg-config`.


#### Adding Dynamic Link Libraries

>*Click on File > Add Files to … and select the image processing libraries needed, pressing CMD + S + G (/usr/local/opt/opencv3/lib)*

- `libopencv_imgproc.3.2.0.dylib`
- core library `libopencv_core.3.2.0.dylib`
- gui library `libopencv_highgui.3.2.0.dylib`
- others as needed ...

#### Command line compile without xcode

```
g++ -v main.cpp -I/usr/local/include \
                -L/usr/lib/ \
                -lstdc++ \
                -L/usr/local/lib \
                -lopencv_highgui \
                -lopencv_core \
                - -o Main
```

#### Some interesting readings

* [Designing Computer Vision Apps 16423](http://16423.courses.cs.cmu.edu/slides/) - Slides from the CMU about CV and geometrical math behind the same.