// controllers/UserController.js

const { Cow, Pasture, User } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')

// Create cow
exports.createUser = async (req, res) => {
  try {
    const {
      name,
      ear_tag,
      date_of_birth,
      type,
      breed,
      herd,
      from_location,
      description,
      pasture_id,
      status
    } = req.body

    const userId = req.user.id

    // Check if a cow with same ear tag exists in same pasture
    const existingCow = await Cow.findOne({
      where: {
        ear_tag,
        // optionally pasture_id
      }
    })

    if (existingCow) {
      return res.status(400).json({ error: 'Cow with this ear tag already exists in this pasture.' })
    }

    // If file uploaded, get path
    let imagePath = null
    if (req.file) {
      imagePath = req.file.path // This is the server path to the file, e.g., 'uploads/cows/1234567890.jpg'
    }

    const newCow = await Cow.create({
      name,
      ear_tag,
      date_of_birth,
      type,
      breed,
      herd,
      from_location,
      description,
      image: imagePath,
      pasture_id,
      status,
      user_id: userId,
    })

    res.status(201).json(newCow)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all users with pasture and user info
exports.getAllUsers = async (req, res) => {
  try {
    const users = await User.findAll({})
    res.json(users)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

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

    await user.update({
      first_name,
      other_name,
      last_name,
      phone,
      email,
      address,
      photo: imagePath,
    })

    res.json(user)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete User by ID
exports.deleteUser = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id)
    if (!cow) return res.status(404).json({ error: 'Cow not found' })

    await cow.destroy()
    res.json({ message: 'Cow deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}