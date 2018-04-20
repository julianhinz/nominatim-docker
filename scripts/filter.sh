#!/bin/bash

if ${FILTER}; then
  echo "Filtering places."
  osmconvert /srv/nominatim/src/data.osm.pbf --drop-version --drop-author -o=/srv/nominatim/src/data_old.o5m
  echo "Filtering places: Converted pbf to o5m, file size:"
  ls -lh /srv/nominatim/src/
  rm /srv/nominatim/src/data.osm.pbf
  echo "Filtering places: Deleted pbf"
#  osmfilter /srv/nominatim/src/data_old.o5m --keep="place=*" --drop-author -o=/srv/nominatim/src/data.o5m
  osmfilter /srv/nominatim/src/data_old.o5m --keep="amenity= boundary= craft= historic= leisure= military= natural= office= place= shop= tourism=" -o=/srv/nominatim/src/data.o5m
  echo "Filtering places: Filtered o5m"
  rm /srv/nominatim/src/data_old.o5m
  echo "Filtering places: Deleted pbf"
  osmconvert /srv/nominatim/src/data.o5m -o=/srv/nominatim/src/data.osm.pbf
  echo "Filtering places: Converted o5m back to pbf, file size:"
  rm /srv/nominatim/src/data.o5m
  ls -lh /srv/nominatim/src/
  echo "Filtering places: Deleted o5m"
  echo "Filtering places: Done"
fi
