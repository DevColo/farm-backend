const express = require('express');
const router = express.Router();
const RoleController = require('../controllers/RoleController');

// Add multer middleware for file upload in create and update routes
router.post('/', RoleController.createUser);
router.put('/:id', RoleController.updateUser);

router.get('/', RoleController.getAllRoles);
router.get('/:id', RoleController.getUserById);
router.delete('/:id', RoleController.deleteUser);

module.exports = router;