#!/bin/bash

### Check for dir, if not found create it using the mkdir ##
[ ! -d DATA ] && mkdir -p DATA

cd DATA

curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:$1 -o GFS_00h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.20191204/00/gfs.t00z.pgrb2.0p50.f000
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:$1 -o GFS_03h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.20191204/00/gfs.t00z.pgrb2.0p50.f003 
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:$1 -o GFS_06h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.20191204/00/gfs.t00z.pgrb2.0p50.f006
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:$1 -o GFS_12h ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.20191204/00/gfs.t00z.pgrb2.0p50.f012