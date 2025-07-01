const { Feeding, Cow, Pasture, User } = require('../models')
const { Op } = require('sequelize')

// Create Feeding
exports.createFeeding = async (req, res) => {
  try {
    const { food, quantity, fed_date, pasture_id } = req.body
    const userId = req.user.id

    const newFeeding = await Feeding.create({
      food,
      quantity,
      fed_date,
      pasture_id,
      user_id: userId,
    })

    res.status(201).json(newFeeding)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all Feeding Records
exports.getFeedings = async (req, res) => {
  try {
    const feedings = await Feeding.findAll({
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
    res.json(feedings)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get a specific Cow by ID
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

// Update Feeding Record by ID
exports.updateFeeding = async (req, res) => {
  try {
    const feeding = await Feeding.findByPk(req.params.id)
    if (!feeding) return res.status(404).json({ error: 'Feeding record not found' })

    const { food, quantity, fed_date, cow_id } = req.body

    await feeding.update({
      food,
      quantity,
      fed_date,
      cow_id,
      updated_by: req.user.id
    })

    res.json(feeding)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete Feeding Record by ID
exports.deleteFeeding = async (req, res) => {
  try {
    const feeding = await Feeding.findByPk(req.params.id)
    if (!feeding) return res.status(404).json({ error: 'Feeding record not found' })

    await feeding.destroy()
    res.json({ message: 'Feeding record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
