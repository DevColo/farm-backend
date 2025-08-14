const { ClinicalCare, Cow, Pasture, User } = require('../models')
const { Op } = require('sequelize')

// Create ClinicalCare
exports.createClinicalCare = async (req, res) => {
  try {
    const { care, description, care_date, cow_id, medicine } = req.body
    const userId = req.user.id

    const newCare = await ClinicalCare.create({
      care,
      description,
      care_date,
      cow_id,
      medicine,
      user_id: userId,
    })

    res.status(201).json(newCare)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all ClinicalCare Records
exports.getClinicalCares = async (req, res) => {
  try {
    const medications = await ClinicalCare.findAll({
      include: [
        {
          model: Cow,
          as: 'cow',
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
    res.json(medications)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update ClinicalCare Record by ID
exports.updateClinicalCare = async (req, res) => {
  try {
    const medic = await ClinicalCare.findByPk(req.params.id)
    if (!medic) return res.status(404).json({ error: 'ClinicalCare record not found' })

    const { care, description, care_date, cow_id, medicine } = req.body

    await medic.update({
      care,
      description,
      care_date,
      cow_id,
      medicine,
      updated_by: req.user.id
    })

    res.json(medic)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete ClinicalCare Record by ID
exports.deleteClinicalCare = async (req, res) => {
  try {
    const medic = await ClinicalCare.findByPk(req.params.id)
    if (!medic) return res.status(404).json({ error: 'ClinicalCare record not found' })

    await medic.destroy()
    res.json({ message: 'ClinicalCare record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
