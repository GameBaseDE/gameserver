#!/bin/bash
envsubst < settings.default.ini > settings.ini
envsubst < webadmin.default.ini > webadmin.ini
./Cuberite
