// controllers/CowController.js

const { Cow, Pasture, User } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')

// Create cow
exports.createCow = async (req, res) => {
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

// Get all cows with pasture and user info
exports.getAllCows = async (req, res) => {
  try {
    const cows = await Cow.findAll({
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture']
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    })
    res.json(cows)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get cow by ID
exports.getCowById = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id, {
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture']
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    })
    if (!cow) return res.status(404).json({ error: 'Cow not found' })
    res.json(cow)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update cow by ID
exports.updateCow = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id)
    if (!cow) return res.status(404).json({ error: 'Cow not found' })

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

    // Check if another cow already has this ear_tag
    const existingCow = await Cow.findOne({
      where: {
        ear_tag,
        id: { [Op.ne]: cow.id } // Exclude current cow by ID
      }
    })

    if (existingCow) {
      return res.status(400).json({ error: 'Another cow with this ear tag already exists.' })
    }

    let imagePath = cow.image

    if (req.body.remove_image === '1' && cow.image && fs.existsSync(cow.image)) {
      fs.unlinkSync(cow.image)
      imagePath = null
    }

    if (req.file) {
      if (cow.image && fs.existsSync(cow.image)) {
        fs.unlinkSync(cow.image)
      }
      imagePath = req.file.path
    }

    await cow.update({
      name,
      ear_tag,
      date_of_birth,
      type,
      breed,
      herd,
      from_location,
      description,
      pasture_id,
      status,
      image: imagePath,
      updated_by: req.user.id
    })

    res.json(cow)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete cow by ID
exports.deleteCow = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id)
    if (!cow) return res.status(404).json({ error: 'Cow not found' })

    await cow.destroy()
    res.json({ message: 'Cow deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
