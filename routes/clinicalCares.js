const express = require('express');
const router = express.Router();
const ClinicalCareController = require('../controllers/ClinicalCareController');

// Add multer middleware
router.post('/', ClinicalCareController.createClinicalCare);
router.put('/:id', ClinicalCareController.updateClinicalCare);

router.get('/', ClinicalCareController.getClinicalCares);
router.delete('/:id', ClinicalCareController.deleteClinicalCare);

module.exports = router;
