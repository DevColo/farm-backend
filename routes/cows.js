const express = require('express');
const router = express.Router();
const CowController = require('../controllers/CowController');
const upload = require('../middleware/cowImageUpload');

// Add multer middleware for file upload in create and update routes
router.post('/', upload.single('image'), CowController.createCow);
router.put('/:id', upload.single('image'), CowController.updateCow);

router.get('/', CowController.getAllCows);
router.get('/:id', CowController.getCowById);
router.delete('/:id', CowController.deleteCow);

module.exports = router;
