const express = require('express');
const router = express.Router();
const UserController = require('../controllers/UserController');
const upload = require('../middleware/userImageUpload');

// Add multer middleware for file upload in create and update routes
router.post('/', upload.single('image'), UserController.createUser);
router.put('/:id', upload.single('image'), UserController.updateUser);

router.get('/', UserController.getAllUsers);
router.get('/:id', UserController.getUserById);
router.delete('/:id', UserController.deleteUser);

module.exports = router;
