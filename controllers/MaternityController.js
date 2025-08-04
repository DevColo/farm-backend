const { Maternity, Cow, Pasture, User } = require('../models')
const { Op } = require('sequelize')

// Create Maternity
exports.createMaternity = async (req, res) => {
  try {
    const { cow_id, bull_id, pregnancy_status, mating_date } = req.body
    const userId = req.user.id

    const newMedication = await Maternity.create({
      cow_id,
      bull_id,
      pregnancy_status,
      mating_date,
      user_id: userId,
    })

    res.status(201).json(newMedication)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all Maternity Records
exports.getMaternities = async (req, res) => {
  try {
    const maternities = await Maternity.findAll({
      include: [
        {
          model: Cow,
          as: 'cow',
          attributes: ['id', 'ear_tag']
        },
        {
          model: Cow,
          as: 'bull',
          attributes: ['id', 'ear_tag']
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
    res.json(maternities)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update Maternity Record by ID
exports.updateMaternity = async (req, res) => {
  try {
    const updatedMaternity = await Maternity.findByPk(req.params.id)
    if (!updatedMaternity) {
      return res.status(404).json({ error: 'Maternity record not found' })
    }

    const { cow_id, bull_id, pregnancy_status, mating_date, birth_date, calf_amount } = req.body

    // Update maternity record
    await updatedMaternity.update({
      cow_id,
      bull_id,
      pregnancy_status,
      mating_date,
      birth_date,
      calf_amount,
      updated_by: req.user.id
    })

    // If a birth_date is provided, update the cow's given_birth field
    if (birth_date) {
      const cow = await Cow.findByPk(updatedMaternity.cow_id)
      if (cow) {
        await cow.update({ given_birth: 1 })
      }
    }

    res.json(updatedMaternity)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}


// Delete Maternity Record by ID
exports.deleteMaternity = async (req, res) => {
  try {
    const deletedMaternity = await Maternity.findByPk(req.params.id)
    if (!deletedMaternity) return res.status(404).json({ error: 'Maternity record not found' })

    await deletedMaternity.destroy()
    res.json({ message: 'Maternity record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
