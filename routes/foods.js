const express = require('express');
const router = express.Router();
const FoodController = require('../controllers/FoodController');

// Add multer middleware
router.post('/', FoodController.createFood);
router.put('/:id', FoodController.updateFood);

router.get('/', FoodController.getFoods);
router.get('/:id', FoodController.getFoodById);
router.delete('/:id', FoodController.deleteFood);

module.exports = router;
