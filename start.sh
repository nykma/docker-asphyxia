#!/bin/bash

if [ -f /app/config/config.ini ]; then
   cp /app{/config,}/config.ini
fi

/app/asphyxia
