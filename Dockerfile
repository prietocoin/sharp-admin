# Usa una imagen base oficial de Node.js
FROM node:20-alpine

# Define el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copia los archivos de configuración y dependencias
# El punto "." representa el directorio actual en el repositorio
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto del código fuente (server.js, etc.)
COPY . .

# Expone el puerto que tu app Express está usando (3001)
EXPOSE 3001

# Comando para iniciar la aplicación
CMD [ "npm", "start" ]
