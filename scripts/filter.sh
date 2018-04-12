#!/bin/bash

if ${FILTER}; then

  echo "Filtering places."

  exec osmconvert /srv/nominatim/src/data.osm.pbf -o=/srv/nominatim/src/data.o5m
  echo "Filtering places: Converted pbf to o5m"
  exec rm /srv/nominatim/src/data.osm.pbf
  echo "Filtering places: Deleted pbf"
  exec osmfilter /srv/nominatim/src/data.o5m --keep="place=*" --drop-author -o=/srv/nominatim/src/data.o5m
  echo "Filtering places: Filtered o5m"
  exec osmconvert /srv/nominatim/src/data.o5m -o=/srv/nominatim/src/data.osm.pbf
  echo "Filtering places: Converted o5m back to pbf"
  exec rm /srv/nominatim/src/data.o5m
  echo "Filtering places: Deleted o5m"
  echo "Filtering places: Done"
fi
