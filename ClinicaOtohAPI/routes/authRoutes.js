// routes/authRoutes.js
const express = require('express');
const router = express.Router();
const db = require('../db');

// Exemplo de rota para login
router.post('/login', async (req, res) => {
  const { usuario, senha } = req.body;

  // Aqui você deve verificar o usuário e a senha no banco de dados
  // Isso é apenas um exemplo simplificado
  try {
    const result = await db.query(
      'SELECT * FROM AuthDB.Usuarios WHERE usuario = $1 AND senha = $2',
      [usuario, senha]
    );

    if (result.rows.length > 0) {
      res.json({ message: 'Login bem-sucedido!' });
    } else {
      res.status(401).json({ message: 'Usuário ou senha inválidos.' });
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Erro ao fazer login');
  }
});

module.exports = router;
