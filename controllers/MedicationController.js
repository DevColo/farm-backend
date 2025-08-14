const { Medication, Cow, Pasture, User } = require('../models')
const { Op } = require('sequelize')

// Create Medication
exports.createMedication = async (req, res) => {
  try {
    const { medication, disease, medication_date, cow_id, diagnosis, symptoms, symptoms_date } = req.body
    const userId = req.user.id

    const newMedication = await Medication.create({
      medication,
      disease,
      medication_date,
      cow_id,
      diagnosis,
      symptoms,
      symptoms_date,
      user_id: userId,
    })

    res.status(201).json(newMedication)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all Medication Records
exports.getMedications = async (req, res) => {
  try {
    const medications = await Medication.findAll({
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

// Update Medication Record by ID
exports.updateMedication = async (req, res) => {
  try {
    const medic = await Medication.findByPk(req.params.id)
    if (!medic) return res.status(404).json({ error: 'Medication record not found' })

    const { medication, disease, medication_date, cow_id, diagnosis, symptoms, symptoms_date } = req.body

    await medic.update({
      medication,
      disease,
      medication_date,
      cow_id,
      diagnosis,
      symptoms,
      symptoms_date,
      updated_by: req.user.id
    })

    res.json(medic)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete Medication Record by ID
exports.deleteMedication = async (req, res) => {
  try {
    const medic = await Medication.findByPk(req.params.id)
    if (!medic) return res.status(404).json({ error: 'Medication record not found' })

    await medic.destroy()
    res.json({ message: 'Medication record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
