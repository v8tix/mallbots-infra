#!/usr/bin/env bash

for port in 8222 8223 8224; do
  curl http://127.0.0.1:$port/routez | grep num_routes
done