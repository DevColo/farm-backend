const express = require('express');
const router = express.Router();
const MilkSalesController = require('../controllers/MilkSalesController');

// Add multer middleware
router.post('/', MilkSalesController.createMilkSales);
router.put('/:id', MilkSalesController.updateMilkSales);

router.get('/', MilkSalesController.getMilkSales);
router.delete('/:id', MilkSalesController.deleteMilkSales);

module.exports = router;
