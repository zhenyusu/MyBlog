# aruco_ros

参考链接: 
https://blog.csdn.net/qq_38288618/article/details/78174577?locationNum=8&fps=1

http://ros-developer.com/2017/04/23/aruco-ros/

github地址:
https://github.com/pal-robotics/aruco_ros.git




## 1. aruco_ros代码下载编译和安装
```
 cd ~/catkin_ws/src/
 git clone https://github.com/pal-robotics/aruco_ros.git
 cd ..
 catkin_make install
 sudo apt-get install ros-indigo-usb-cam
 source install/setup.bash
```

## 2. 修改single.launch文件
```xml


<launch>

    <arg name="markerId"        default="289"/>
    <arg name="markerSize"      default="0.05"/>    <!-- in m -->
    <arg name="eye"             default="left"/>
    <arg name="marker_frame"    default="aruco_marker_frame"/>
    <arg name="ref_frame"       default=""/>  <!-- leave empty and the pose will be published wrt param parent_name -->
    <arg name="corner_refinement" default="LINES" /> <!-- NONE, HARRIS, LINES, SUBPIX -->


    <node pkg="aruco_ros" type="single" name="aruco_single">

        <remap from="/camera_info" to="/usb_cam/camera_info"/>
        <remap from="/image" to="/usb_cam/image_raw" />
        <!--<remap from="/image" to="/skysys/main_camera_image"/>-->
        <param name="image_is_rectified" value="True"/>
        <param name="marker_size"        value="$(arg markerSize)"/>
        <param name="marker_id"          value="$(arg markerId)"/>
        <param name="reference_frame"    value="$(arg ref_frame)"/>   <!-- frame in which the marker pose will be refered -->
        <param name="camera_frame"       value="stereo_gazebo_$(arg eye)_camera_optical_frame"/>
        <param name="marker_frame"       value="$(arg marker_frame)" />
        <param name="corner_refinement"  value="$(arg corner_refinement)" />
    </node>

</launch>


```

## 3.新建 usb_cam-stream.launch
**注意 video_device的value**

```xml

<launch>
    <node name="usb_cam" pkg="usb_cam" type="usb_cam_node" output="screen" >
    <param name="video_device" value="/dev/video0"/>
    <param name="image_width" value="640" />
    <param name="image_height" value="480" />
    <param name="pixel_format" value="mjpeg" />
    <param name="camera_frame_id" value="usb_cam" />
    <param name="io_method" value="mmap"/>
    </node>
</launch>

```

## 4.运行

`source devel/setup.bash`

启动摄像头节点：`roslaunch usb_cam-stream.launch `
启动识别tag节点：`roslaunch single.launch`
查看界面：`$rosrun image_view image_view image:=/aruco_single/result`






