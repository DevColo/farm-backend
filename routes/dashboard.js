const express = require('express');
const router = express.Router();
const DashboardController = require('../controllers/DashboardController');

// Add multer middleware for file upload in create and update routes
router.get('/stats', DashboardController.getDashboardStats);
router.get('/data', DashboardController.getDashboardData);

module.exports = router;
