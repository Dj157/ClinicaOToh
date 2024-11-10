import React, { useState, useEffect } from 'react';
import axios from 'axios';

function PacientesList() {
  const [pacientes, setPacientes] = useState([]);

  useEffect(() => {
    const fetchPacientes = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/pacientes');
        setPacientes(response.data);
      } catch (error) {
        console.error('Erro ao buscar pacientes', error);
      }
    };

    fetchPacientes();
  }, []);

  return (
    <div>
      <h2>Lista de Pacientes</h2>
      <ul>
        {pacientes.map((paciente) => (
          <li key={paciente.cpf}>
            {paciente.nome} - {paciente.cpf}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default PacientesList;
