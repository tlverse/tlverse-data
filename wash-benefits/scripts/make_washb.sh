#!/bin/bash

mkdir raw_data
cd raw_data
wget https://files.osf.io/v1/resources/pqzj5/providers/osfstorage/?zip=
unzip index.html\?zip\=
cd ..
Rscript make_washb_export.R
rm -rf raw_data
