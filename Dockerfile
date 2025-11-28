# Usa una imagen base oficial de Node.js ligera (Alpine)
FROM node:20-alpine

# --- INSTALAR CLIENTE DOCKER (LA SOLUCIÓN) ---
RUN apk add --no-cache docker-cli
# ---------------------------------------------

# Crear directorio de trabajo
WORKDIR /usr/src/app

# Copiar dependencias
COPY package*.json ./

# Instalar dependencias de Node
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer el puerto
EXPOSE 3001

# Iniciar la app
CMD [ "npm", "start" ]
