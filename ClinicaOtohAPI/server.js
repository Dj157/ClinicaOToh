const express = require('express');
const dotenv = require('dotenv');
const pacientesRoutes = require('./routes/pacientesRoutes'); // Importação das rotas de pacientes

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para analisar JSON
app.use(express.json());

// Teste na raiz
app.get('/', (req, res) => {
    res.send('API da Clínica Otoh está funcionando!');
});

// Usando a rota de pacientes
app.use('/pacientes', pacientesRoutes);

// Iniciar o servidor
app.listen(PORT, () => {
    console.log(`Servidor rodando em http://localhost:${PORT}`);
});
