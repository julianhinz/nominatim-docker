#!/bin/bash

if ${FILTER}; then
  RUN echo "Filtering places."
  RUN osmconvert /srv/nominatim/src/data.osm.pbf -o=/srv/nominatim/src/data.o5m
  RUN echo "Filtering places: Converted pbf to o5m"
  RUN rm /srv/nominatim/src/data.osm.pbf
  RUN echo "Filtering places: Deleted pbf"
  RUN osmfilter /srv/nominatim/src/data.o5m --keep="place=*" --drop-author -o=/srv/nominatim/src/data.o5m
  RUN echo "Filtering places: Filtered o5m"
  RUN osmconvert /srv/nominatim/src/data.o5m -o=/srv/nominatim/src/data.osm.pbf
  RUN echo "Filtering places: Converted o5m back to pbf"
  RUN rm /srv/nominatim/src/data.o5m
  RUN echo "Filtering places: Deleted o5m"
  RUN echo "Filtering places: Done"
fi
