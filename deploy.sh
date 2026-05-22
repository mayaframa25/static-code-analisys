#!/bin/bash

# Mover el archivo de configuración de Nginx al sitio correcto
cp /home/site/wwwroot/nginx.conf /etc/nginx/sites-available/default

# Recargar Nginx para aplicar cambios
service nginx reload
