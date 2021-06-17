# Configuration on Cluster with Centos 7

Giraph is running on the top of Hadoop, so the first thing to do is to install the Hadoop

## 1. Hadoop
### 1.1 Hadoop-2.7.6 installation 
install Hadoop on every node in a cluster - [reference](http://dblab.xmu.edu.cn/blog/1177-2/)

one Master node and mutiple Slave nodes

files to modify in $HADOOP/etc/hadoop/:
1. core-site.xml
2. hdfs-size.xml
3. yarn-site.xml
4. mapred-site.xml
5. hadoop-env.sh
6. slaves (or workers for political correctness)

### 1.2 frequently used commands
* Upload a file to HDFS: ```hadoop hdfs -copyFromLocal /local/file /remote/repository```
* Run a program: ```haddop jar xxx.jar -option xxx```


## 2. Giraph 

install Giraph on the master node is sufficient - [reference](https://blog.csdn.net/HNUPCJ/article/details/105812167)
