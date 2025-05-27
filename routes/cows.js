const express = require('express');
const router = express.Router();
const CowController = require('../controllers/CowController');

router.post('/', CowController.createCow);
router.get('/', CowController.getAllCows);
router.get('/:id', CowController.getCowById);
router.put('/:id', CowController.updateCow);
router.delete('/:id', CowController.deleteCow);

module.exports = router;
