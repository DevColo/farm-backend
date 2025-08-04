const express = require('express');
const router = express.Router();
const CowSalesController = require('../controllers/CowSalesController');

// Add multer middleware
router.post('/', CowSalesController.createCowSales);
router.put('/:id', CowSalesController.updateCowSales);

router.get('/', CowSalesController.getCowSales);
router.delete('/:id', CowSalesController.deleteCowSales);

module.exports = router;
