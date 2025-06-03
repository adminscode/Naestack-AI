
import React, { useState } from 'react';
import axios from '../services/api';

export default function ResourceForm() {
  const [formData, setFormData] = useState({ resourceType: '', region: '' });

  const handleChange = e => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async e => {
    e.preventDefault();
    await axios.post('/api/saveConfig', formData);
    alert('Configuration saved!');
  };

  return (
    <form onSubmit={handleSubmit}>
      <input name="resourceType" onChange={handleChange} placeholder="Resource Type" />
      <input name="region" onChange={handleChange} placeholder="Region" />
      <button type="submit">Submit</button>
    </form>
  );
}
