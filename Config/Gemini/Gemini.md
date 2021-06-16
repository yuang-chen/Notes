# 1 Configuration on Ubuntu

## 1.1 Intel for Gemini
    * ipcp & mpiicpc:
    * oneAPI 2021.2.0: ```l_HPCKit_p_2021.2.0.2997.sh```
    * after installation, set the environment: ```source /opt/intel/oneapi/setvars.sh```
    * it works for Gemini, but not for PowerGraph nor PowerLyra
    * when running Gemini, set the gcc&g++ to 9/10


# 2 Configuration on CentOS
The Cluster with CentOS 7 raises a variety of issues:
* install Intel icc & mpiicc and its belonging environment setting
* Munge & Slurm for distributed computting

## 2.1 Cluster Setting: 
1. admin node: mu01 - the one we login using **ssh** (e.g., ```ssh yuang@10.26.1.30```)
2. computing node: gpu01~08 - the ones we can access via **rlogin**, **rsh**, and **rexec** from *mu01* (e.g., ```rlogin gpu01```)
3. storing node: mds01~02

## 2.2 Compiler
1. Intel for Gemini
    * there exist an Intel ICC 18.0.1 that fails to compile Gemini, causing conflits!
    * install the oneAPI tool kit in *mu01* following the instrunction on Ubuntu
    * specify the installation path: ```source /opt/soft/oneapi/setvars.sh```

2. Update *libstdc++*
    * repeat following commands on every computing node, e.g., gpu01 ~ gpu08
    ```
    cp /opt/soft/libstdc++.so.6.0.26 /usr/lib64/ &&

    mv /usr/lib64/libstdc++.so.6 /usr/lib64/libstdc++.so.6.old &&

    ln -s /usr/lib64/libstdc++.so.6.0.26 /usr/lib64/libstdc++.so.6
    ```
## 2.3 Fix fabrics provider
export environment variable of Open Fabrics Interfaces 
1. [set OFI Provider](https://community.intel.com/t5/Intel-oneAPI-HPC-Toolkit/New-MPI-error-with-Intel-2019-1-unable-to-run-MPI-hello-world/td-p/1158382): 
2. [Intel MPI Over Libfabric](https://software.intel.com/content/www/us/en/develop/articles/intel-mpi-library-2019-over-libfabric.html)
```
export I_MPI_PMI_LIBRARY=/usr/lib64/libpmi.so
export I_MPI_OFI_PROVIDER = sockets  
```

## 2.4 Munge & Slurm
install *munge* and *slurm* with [ref1](https://github.com/Artlands/Install-Slurm) and [ref2](https://github.com/hopehpc/slurm17-centos7)

# 3. Switch between the mess of softwares
use [module](https://modules.readthedocs.io/en/stable/INSTALL.html) to clean the environment

add the environment variable:
```export MODULEPATH="${MODULEPATH}:/path/to/my/modules```
