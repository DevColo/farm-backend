const express = require('express');
const router = express.Router();
const FeedingController = require('../controllers/FeedingController');

// Add multer middleware
router.post('/', FeedingController.createFeeding);
router.put('/:id', FeedingController.updateFeeding);

router.get('/', FeedingController.getFeedings);
router.get('/:id', FeedingController.getFeedingById);
router.delete('/:id', FeedingController.deleteFeeding);

module.exports = router;
