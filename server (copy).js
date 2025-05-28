const express = require('express');
const cors = require('cors');
require('dotenv').config();

const { sequelize } = require('./models');
const authenticate = require('./middleware/authenticate');

const app = express();
app.use(cors({
  origin: 'http://localhost:5173',
  credentials: true              
}));
app.use(express.json());

// Routes
app.use('/api/login', require('./routes/auth'));

// Pasture routes with authentication middleware
const pastureRoutes = require('./routes/pastures');
app.use('/api/pastures', authenticate, pastureRoutes);

const cowRoutes = require('./routes/cows');
app.use('/api/cows', authenticate, cowRoutes);

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
