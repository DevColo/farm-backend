// controllers/CowController.js

const { Cow, Pasture, User } = require('../models')

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
      image,
      pasture_id,
      status
    } = req.body

    const userId = req.user.id

    // Check if a cow with same ear tag exists in same pasture
    const existingCow = await Cow.findOne({
      where: {
        ear_tag,
        pasture_id
      }
    })

    if (existingCow) {
      return res.status(400).json({ error: 'Cow with this ear tag already exists in this pasture.' })
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
      image,
      pasture_id,
      status
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
      ear_tag,
      date_of_birth,
      type,
      breed,
      herd,
      description,
      pasture_id,
      status
    } = req.body

    await cow.update({
      ear_tag,
      date_of_birth,
      type,
      breed,
      herd,
      description,
      pasture_id,
      status,
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
