const express = require('express');
const { exec } = require('child_process');

const app = express();
const PORT = 3001; 
// !!! REEMPLAZA ESTO: USA EL NOMBRE REAL DEL CONTENEDOR DE SHARP EN EASYPANEL !!!
const SHARP_CONTAINER_NAME = 'automatizaciones_sharp'; 

app.use(express.json());

// Endpoint de reinicio (n8n llamará a esta ruta)
app.post('/restart-sharp', (req, res) => {
    console.log(`[ADMIN] Solicitud de reinicio recibida para ${SHARP_CONTAINER_NAME}`);

    // Comando Docker a ejecutar
    const command = `docker restart ${SHARP_CONTAINER_NAME}`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error al ejecutar comando: ${error.message}`);
            return res.status(500).json({ status: 'ERROR', message: 'Fallo al reiniciar el contenedor', details: stderr });
        }

        console.log(`[ADMIN] Contenedor ${SHARP_CONTAINER_NAME} reiniciado con éxito.`);
        res.status(200).json({ status: 'OK', message: 'Contenedor Sharp reiniciado con éxito', output: stdout });
    });
});

app.listen(PORT, () => {
    console.log(`Sharp Admin Service escuchando en el puerto ${PORT}`);
});
