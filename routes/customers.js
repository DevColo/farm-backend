const express = require('express');
const router = express.Router();
const CustomerController = require('../controllers/CustomerController');

// Add multer middleware
router.post('/', CustomerController.createCustomer);
router.put('/:id', CustomerController.updateCustomer);

router.get('/', CustomerController.getCustomers);
router.get('/:id', CustomerController.getCustomerById);
router.delete('/:id', CustomerController.deleteCustomer);

module.exports = router;