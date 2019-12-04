# WRF_Singularity

Before getting started, follow the directions on the [Singularity Installation page](https://sylabs.io/guides/3.5/user-guide/installation.html).


#### Clone the repository

```
git clone https://github.com/martinjoshua/WRF_Singularity.git`
cd WRF_Singularity
```

#### Download GEO data

```
wget http://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
tar xzvf geog_high_res_mandatory.tar.gz
```

#### Build the singularity image for the WRF-ARW

```
sudo singularity build wrf.sif ubuntu1804.def
```

#### Download the initialization files for the WRF from NCEP (modify download.sh to change date/time)

```
cd wrf-run
chmod +x download.sh
./download.sh <your e-mail address>
```

#### Modify the below namelists to match the downloaded files

```
nano namelist.wps
nano namelist.input
```

#### Shell into the singularity image and mount the GEOG data to /mnt/WPS_GEOG

```
singularity shell --bind /<path to GEOG data>/WPS_GEOG:/mnt/WPS_GEOG ../singularity/wrf.sif
```

#### Run WPS (within the shell)

```
/opt/Build_WRF/Run/WPS/geogrid.exe
```

#### Run the link_grib script (which copies and renames the grib files in the DATA directory to the working directory)

```
./link_grib.csh DATA/GFS
```

#### Run ungrib
```
/opt/Build_WRF/Run/WPS/ungrib.exe
```

#### Run metgrid

```
/opt/Build_WRF/Run/WPS/metgrid.exe
```

##### Run WRF
```
/opt/Build_WRF/Run/WRF/wrf.exe
```
