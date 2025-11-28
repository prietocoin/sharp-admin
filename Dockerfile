# Usa una imagen base oficial de Node.js
FROM node:20-alpine

# --- ESTA ES LA LÍNEA QUE FALTABA ---
# Instala el cliente de Docker para poder ejecutar comandos
RUN apk add --no-cache docker-cli
# ------------------------------------

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3001

CMD [ "npm", "start" ]
