const express = require('express');
const router = express.Router();
const MedicationController = require('../controllers/MedicationController');

// Add multer middleware
router.post('/', MedicationController.createMedication);
router.put('/:id', MedicationController.updateMedication);

router.get('/', MedicationController.getMedications);
router.delete('/:id', MedicationController.deleteMedication);

module.exports = router;
