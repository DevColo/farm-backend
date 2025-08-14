const express = require('express');
const cors = require('cors');
require('dotenv').config();

const { sequelize } = require('./models');
const authenticate = require('./middleware/authenticate');

const app = express();

// CORS setup
app.use(cors({
  // Frontend URL
  origin: 'http://localhost:5173', 
  credentials: true
}));

// Middleware to parse JSON bodies
app.use(express.json());

// === Routes ===

// Public routes
app.use('/api/login', require('./routes/auth'));

// Protected routes (require authentication)
app.use('/api/dashboard', authenticate, require('./routes/dashboard'));
app.use('/api/pastures', authenticate, require('./routes/pastures'));
app.use('/api/cows', authenticate, require('./routes/cows'));
app.use('/api/daily-milk-records', authenticate, require('./routes/dailyMilkRecords'));
app.use('/api/foods', authenticate, require('./routes/foods'));
app.use('/api/feedings', authenticate, require('./routes/feedings'));
app.use('/api/medications', authenticate, require('./routes/medications'));
app.use('/api/users', authenticate, require('./routes/users'));
app.use('/api/roles', authenticate, require('./routes/roles'));
app.use('/api/maternities', authenticate, require('./routes/maternities'));
app.use('/api/customers', authenticate, require('./routes/customers'));
app.use('/api/milk-sales', authenticate, require('./routes/milkSales'));
app.use('/api/cow-sales', authenticate, require('./routes/cowSales'));
app.use('/api/clinical-cares', authenticate, require('./routes/clinicalCares'));

//  Access uploaded files
app.use('/uploads', express.static('uploads'));

// Test DB connection
sequelize.authenticate()
  .then(() => console.log('Database connected'))
  .catch(err => console.error('Database connection error:', err));

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
