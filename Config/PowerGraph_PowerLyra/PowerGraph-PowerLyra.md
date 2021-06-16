# 1 Configuration on Ubuntu

## 1.1 GNU for PowerGraph and PowerLyra
    * g++ 4.8.5
    * download by firstly edit the ```/etc/apt/sources.list```: 
       - add: ```deb https://mirrors.ustc.edu.cn/ubuntu/  trusty  main universe```
    * in terminal: ```sudo apt update && sudo apt install g++4.4```
    * OpenMPI 4.0.3 (to test)
    * MPICH (recommended, and to test)


## 1.2 CMakeLists for PowerGraph & PowerLyra
one must update the **CMakeLists** to fix the broken downloading links and LD_LIBRARY_PATH (this issue occurs in Ubuntu) 

# 2 Configuration on CentOS
The Cluster with CentOS 7 raises a variety of issues:
* install Intel icc & mpiicc and its belonging environment setting

## 2.1 Cluster Setting: 
1. admin node: mu01 - the one we login using **ssh** (e.g., ```ssh yuang@10.26.1.30```)
2. computing node: gpu01~08 - the ones we can access via **rlogin**, **rsh**, and **rexec** from *mu01* (e.g., ```rlogin gpu01```)
3. storing node: mds01~02

Everything we install in /opt/soft/ are shared through the cluster.


