#!/bin/bash

if ${FILTER}; then
  echo "Filtering places."

  exec osmconvert /srv/nominatim/src/data.osm.pbf -o=/srv/nominatim/src/data.o5m
  exec osmfilter /srv/nominatim/src/data.o5m --keep="place=*" --drop-author -o=/srv/nominatim/src/data.o5m
  exec osmconvert /srv/nominatim/src/data.o5m -o=/srv/nominatim/src/data.osm.pbf
  exec rm /srv/nominatim/src/data.o5m

fi
