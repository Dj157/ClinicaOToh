// routes/consultasRoutes.js
const express = require('express');
const router = express.Router();
const db = require('../db');

// Endpoint para obter todas as consultas
router.get('/', async (req, res) => {
  try {
    const result = await db.query('SELECT * FROM ConsultasDB.Consultas');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Erro ao obter consultas');
  }
});

// Endpoint para adicionar uma nova consulta
router.post('/', async (req, res) => {
  const { paciente_id, data, hora, medico_id, especialidade, historico_exame } = req.body;

  try {
    const result = await db.query(
      'INSERT INTO ConsultasDB.Consultas (paciente_id, data, hora, medico_id, especialidade, historico_exame) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *',
      [paciente_id, data, hora, medico_id, especialidade, historico_exame]
    );

    res.status(201).json(result.rows[0]);
  } catch (err) {
    console.error('Erro ao adicionar consulta:', err);
    res.status(500).send('Erro ao adicionar consulta');
  }
});

module.exports = router;
