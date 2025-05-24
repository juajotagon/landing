# Usar una imagen base oficial de Nginx ligera
FROM nginx:alpine

# Eliminar la configuración por defecto de Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Crear un archivo de configuración simple para Nginx
# Esto asegura que Nginx sirva index.html para cualquier petición a la raíz
# y maneje correctamente los assets.
COPY nginx.conf /etc/nginx/conf.d/default.conf


COPY index.html /usr/share/nginx/html/
COPY media /usr/share/nginx/html/media/
# Si tu foto tiene otro nombre, cámbialo arriba y en el index.html

# Exponer el puerto 80 (Nginx escucha en este puerto por defecto)
EXPOSE 80

# Comando para iniciar Nginx cuando el contenedor arranque
CMD ["nginx", "-g", "daemon off;"]