const express = require('express');
const router = express.Router();
const PastureController = require('../controllers/PastureController');

router.post('/', PastureController.createPasture);
router.get('/', PastureController.getAllPastures);
router.get('/:id', PastureController.getPastureById);
router.put('/:id', PastureController.updatePasture);
router.delete('/:id', PastureController.deletePasture);

module.exports = router;
