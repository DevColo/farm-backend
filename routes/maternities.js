const express = require('express');
const router = express.Router();
const MaternityController = require('../controllers/MaternityController');

// Add multer middleware
router.post('/', MaternityController.createMaternity);
router.put('/:id', MaternityController.updateMaternity);

router.get('/', MaternityController.getMaternities);
router.delete('/:id', MaternityController.deleteMaternity);

module.exports = router;
