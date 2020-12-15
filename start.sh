#!/bin/bash

if [ -f /app/config/config.ini ]; then
    rm /app/config.ini
    ln -s /app/config/config.ini /app/config.ini
fi

if [ ! "$(ls -A /app/plugins)" ]; then
    # Only copy init plugins if dir is empty
    cp -r /app/plugins_sample/* /app/plugins
fi

# TODO: -d param seems not working in v1.20f
/app/asphyxia -d /app/save
