// controllers/RoleController.js

const { User, Role } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')
const bcrypt = require('bcryptjs')

// Create User
exports.createUser = async (req, res) => {
  try {
    const {
      first_name,
      other_name,
      last_name,
      phone,
      email,
      address,
      password,
      roles, 
    } = req.body;

    // Check if user already exists
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ error: 'User with this email already exists.' });
    }

    // Handle image upload
    let imagePath = null;
    if (req.file) {
      imagePath = req.file.path;
    }

    // Hash password
    let hashedPassword = null;
    if (password && password.trim() !== '') {
      hashedPassword = await bcrypt.hash(password, 10);
    }

    // Create user
    const newUser = await User.create({
      first_name,
      other_name,
      last_name,
      phone,
      email,
      address,
      password: hashedPassword,
      photo: imagePath,
    });

    // Assign role(s) to user
    if (roles) {
      const roleRecords = await Role.findAll({
        where: { name: { [Op.in]: Array.isArray(roles) ? roles : [roles] } }
      });

      if (roleRecords.length === 0) {
        return res.status(400).json({ error: 'Invalid role(s) provided.' });
      }

      await newUser.setRoles(roleRecords);
    }

    res.status(201).json(newUser);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all roles with pasture and user info
exports.getAllRoles = async (req, res) => {
  try {
    const roles = await Role.findAll();

    res.json(roles);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// exports.getAllUsers = async (req, res) => {
//   try {
//     const users = await User.findAll({})
//     res.json(users)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//   }
// }

// Get User by ID
exports.getUserById = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id, {})
    if (!user) return res.status(404).json({ error: 'User not found' })
    res.json(user)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update User by ID
exports.updateUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id)
    if (!user) return res.status(404).json({ error: 'User not found' })

    const {
      first_name,
      other_name,
      last_name,
      phone,
      email,
      address,
      password,  // get password from body
    } = req.body

    // Check if another user already has this email
    const existingUser = await User.findOne({
      where: {
        email,
        id: { [Op.ne]: user.id }
      }
    })

    if (existingUser) {
      return res.status(400).json({ error: 'Another user with this email already exists.' })
    }

    let imagePath = user.photo

    if (req.body.remove_image === '1' && user.photo && fs.existsSync(user.photo)) {
      fs.unlinkSync(user.photo)
      imagePath = null
    }

    if (req.file) {
      if (user.photo && fs.existsSync(user.photo)) {
        fs.unlinkSync(user.photo)
      }
      imagePath = req.file.path
    }

    const updatedData = {
      first_name,
      other_name,
      last_name,
      phone,
      email,
      address,
      photo: imagePath,
    }
    // If password is submitted and not empty, hash and update it
    if (password && password.trim() !== '') {
      updatedData.password = password
    }

    await user.update(updatedData)

    res.json(user)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// exports.updateUser = async (req, res) => {
//   try {
//     const user = await User.findByPk(req.params.id)
//     if (!user) return res.status(404).json({ error: 'User not found' })

//     const {
//       first_name,
//       other_name,
//       last_name,
//       phone,
//       email,
//       address,
//     } = req.body

//     // Check if another user already has this email
//     const existingUser = await User.findOne({
//       where: {
//         email,
//         id: { [Op.ne]: user.id }
//       }
//     })

//     if (existingUser) {
//       return res.status(400).json({ error: 'Another user with this email already exists.' })
//     }

//     let imagePath = user.photo

//     if (req.body.remove_image === '1' && user.photo && fs.existsSync(user.photo)) {
//       fs.unlinkSync(user.photo)
//       imagePath = null
//     }

//     if (req.file) {
//       if (user.photo && fs.existsSync(user.photo)) {
//         fs.unlinkSync(user.photo)
//       }
//       imagePath = req.file.path
//     }

//     await user.update({
//       first_name,
//       other_name,
//       last_name,
//       phone,
//       email,
//       address,
//       photo: imagePath,
//     })

//     res.json(user)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//   }
// }

// Delete User by ID
exports.deleteUser = async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id)
    if (!user) return res.status(404).json({ error: 'User not found' })

    await user.destroy()
    res.json({ message: 'User deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}