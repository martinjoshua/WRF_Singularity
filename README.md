# WRF Singularity

Before getting started, follow the directions on the [Singularity Installation page](https://sylabs.io/guides/3.5/user-guide/installation.html).


#### Install mpich on the host and clone the repository

```
sudo apt-get install mpich
git clone https://github.com/martinjoshua/WRF_Singularity.git
cd WRF_Singularity
```

#### Download GEO data

```
wget http://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
tar xzvf geog_high_res_mandatory.tar.gz
```

#### Build the singularity image for the WRF-ARW

```
cd ubuntu
sudo singularity build ../wrf.sif ubuntu1804.def
# OR
cd centos
sudo singularity build ../wrf.sif centos7.def
```

#### Set exec permission and download the initialization data for the WRF from NCEP (modify urls.txt to change date/time)

```
cd ../wrf-run
chmod +x run.sh
./run.sh <your e-mail address>
```

#### Modify the below namelists to match the downloaded files

```
nano namelist.wps
nano namelist.input
```

#### Run geogrid (binding the WPS_GEOG directory to /mnt/WPS_GEOG)

```
singularity exec --bind ../WPS_GEOG:/mnt/WPS_GEOG ../wrf.sif "/opt/Build_WRF/Run/WPS/geogrid.exe"
```

#### Run ungrib

```
singularity exec --bind ../WPS_GEOG:/mnt/WPS_GEOG ../wrf.sif "/opt/Build_WRF/Run/WPS/ungrib.exe"
```

#### Run metgrid

```
singularity exec --bind ../WPS_GEOG:/mnt/WPS_GEOG ../wrf.sif "/opt/Build_WRF/Run/WPS/metgrid.exe"
```

#### Run real

```
singularity exec --bind ../WPS_GEOG:/mnt/WPS_GEOG ../wrf.sif "/opt/Build_WRF/Run/WRF/real.exe"
```

#### Run WRF (setting number of processors to 2)

```
mpirun -np 2 singularity exec --bind ../WPS_GEOG:/mnt/WPS_GEOG ../wrf.sif "/opt/Build_WRF/Run/WRF/wrf.exe"
```
