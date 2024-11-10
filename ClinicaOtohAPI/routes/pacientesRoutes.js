// routes/pacientesRoutes.js
const express = require('express');
const router = express.Router();
const db = require('../db');

// Endpoint para obter todos os pacientes
router.get('/', async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM PacientesDB.Pacientes');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Erro ao obter pacientes');
  }
});

module.exports = router;

// Rota para adicionar um novo paciente
router.post('/', async (req, res) => {
    const { nome, cpf, data_nascimento, telefone, email, endereco } = req.body;
    try {
        const result = await db.query(
            'INSERT INTO PacientesDB.Pacientes (nome, cpf, data_nascimento, telefone, email, endereco) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
            [nome, cpf, data_nascimento, telefone, email, endereco]
        );
        res.status(201).json(result.rows[0]);  // Aqui usamos o status 201
    } catch (error) {
        console.error('Erro ao adicionar paciente:', error);
        res.status(500).json({ error: 'Erro ao adicionar paciente' });
    }
});
