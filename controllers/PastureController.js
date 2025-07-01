/*
* controllers/PastureController
*/
const { Pasture, User, Cow } = require('../models')
const { Op, Sequelize } = require('sequelize')

// Create pasture
exports.createPasture = async (req, res) => {
  try {
    const { pasture, country, description, status } = req.body
    const userId = req.user.id

    // Check if a pasture with the same name exists in the same country
    const existingPasture = await Pasture.findOne({
      where: {
        pasture,
        country,
      }
    })

    if (existingPasture) {
      return res.status(400).json({ error: 'Pasture already exists in this country.' })
    }

    const newPasture = await Pasture.create({
      pasture,
      country,
      description,
      status,
      user_id: userId
    })

    res.status(201).json(newPasture)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// // Get all pastures
exports.getAllPastures = async (req, res) => {
  try {
    const pastures = await Pasture.findAll({
      attributes: {
        include: [
          [
            Sequelize.fn('COUNT', Sequelize.col('cows.id')),
            'cow_count'
          ]
        ]
      },
      include: [
        {
          model: User,
          as: 'user',
          attributes: ['id', 'email', 'first_name', 'last_name'],
        },
        {
          model: Cow,
          as: 'cows',
          attributes: [], // skip cow details, just counting
          required: false,
        }
      ],
      group: ['Pasture.id', 'user.id'],
      order: [['id', 'ASC']]
    });

    res.json(pastures);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: error.message });
  }
};



// exports.getAllPastures = async (req, res) => {
//   try {
//     const pastures = await Pasture.findAll({
//       include: [
//         {
//           model: User,
//           as: 'user',
//           attributes: ['id', 'email', 'first_name', 'last_name'],
//         },
//       ],
//     })
//     res.json(pastures)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//   }
// }

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

    const { pasture: pastureName, country, description, status } = req.body
    const userId = req.user.id

    // Check if another pasture with the same name and country exists (exclude current)
    const existingPasture = await Pasture.findOne({
      where: {
        pasture: pastureName,
        country,
        id: { [Op.ne]: pasture.id }
      }
    })

    if (existingPasture) {
      return res.status(400).json({ error: 'Pasture already exists in this country.' })
    }

    await pasture.update({
      pasture: pastureName,
      country,
      description,
      status,
      updated_by: userId,
      updated_at: new Date()
    })

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
