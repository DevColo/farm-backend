const express = require('express');
const router = express.Router();
const DailyMilkRecordController = require('../controllers/DailyMilkRecordController');

// Add multer middleware for file upload in create and update routes
router.post('/', DailyMilkRecordController.createMilkRecord);
router.put('/:id', DailyMilkRecordController.updateMilkRecord);

router.get('/', DailyMilkRecordController.getMilkRecords);
router.get('/:id', DailyMilkRecordController.getCowById);
router.delete('/:id', DailyMilkRecordController.deleteMilkRecord);

module.exports = router;
