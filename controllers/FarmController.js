const db = require('../db');

exports.getAllFarms = async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM farms');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.createFarm = async (req, res) => {
  const { name, location } = req.body;
  try {
    await db.query('INSERT INTO farms (name, location) VALUES (?, ?)', [name, location]);
    res.status(201).json({ message: 'Farm created successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
