/*
* controllers/PastureController
*/
const { Pasture } = require('../models')

// Create pasture
exports.createPasture = async (req, res) => {
  try {
    const { name, country, active } = req.body
    const userId = req.user.id

    const newPasture = await Pasture.create({
      name,
      country,
      active,
      user_id: userId
    })

    res.status(201).json(newPasture)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all pastures
exports.getAllPastures = async (req, res) => {
  try {
    const pastures = await Pasture.findAll()
    res.json(pastures)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get pasture by ID
exports.getPastureById = async (req, res) => {
  try {
    const pasture = await Pasture.findByPk(req.params.id)
    if (!pasture) return res.status(404).json({ error: 'Pasture not found' })
    res.json(pasture)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update pasture by ID
exports.updatePasture = async (req, res) => {
  try {
    const pasture = await Pasture.findByPk(req.params.id)
    if (!pasture) return res.status(404).json({ error: 'Pasture not found' })

    const { name, country, active } = req.body
    await pasture.update({ name, country, active })

    res.json(pasture)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete pasture by ID
exports.deletePasture = async (req, res) => {
  try {
    const pasture = await Pasture.findByPk(req.params.id)
    if (!pasture) return res.status(404).json({ error: 'Pasture not found' })

    await pasture.destroy()
    res.json({ message: 'Pasture deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
