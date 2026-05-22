#!/bin/bash

# 1. Copiar una configuración personalizada de Nginx para Laravel
# Esta configuración obligará al servidor a buscar el index.php dentro de /public
cat << 'EOF' > /etc/nginx/sites-available/default
server {
    listen 80;
    listen [::]:80;
    root /home/site/wwwroot/public;
    index index.php index.html index.htm;
    server_name localhost;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass 127.0.0.1:9000;
    }
}
EOF

# 2. Recargar Nginx para aplicar los cambios de ruta inmediatamente
service nginx reload
