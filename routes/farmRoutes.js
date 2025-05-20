const express = require('express');
const router = express.Router();
const farmController = require('../controllers/FarmController');

router.get('/', farmController.getAllFarms);
router.post('/', farmController.createFarm);

module.exports = router;
