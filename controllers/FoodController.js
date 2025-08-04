/*
* controllers/FoodController
*/
const { Food, User, Feeding } = require('../models')
const { Op } = require('sequelize')

// Create Food
exports.createFood = async (req, res) => {
  try {
    const { food, quantity, description } = req.body
    const userId = req.user.id

    const newFood = await Food.create({
      food,
      quantity,
      description,
      user_id: userId,
    })

    res.status(201).json(newFood)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all Food Records
exports.getFoods = async (req, res) => {
  try {
    const foods = await Food.findAll({
      include: [
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name'],
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name'],
        },
        {
          model: Feeding,
          required: false,
        }
      ]
    });

    res.json(foods);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get a specific Food by ID
exports.getFoodById = async (req, res) => {
  try {
    const food = await Food.findByPk(req.params.id, {
      include: [
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

    if (!food) return res.status(404).json({ error: 'Food not found' })
    res.json(food)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update Food Record by ID
exports.updateFood = async (req, res) => {
  try {
    const updatedFood = await Food.findByPk(req.params.id)
    if (!updatedFood) return res.status(404).json({ error: 'Food record not found' })

    const { food, quantity, description } = req.body

    await updatedFood.update({
      food,
      quantity,
      description,
      updated_by: req.user.id
    })

    res.json(updatedFood)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete Food Record by ID
exports.deleteFood = async (req, res) => {
  try {
    const deletedFood = await Food.findByPk(req.params.id)
    if (!deletedFood) return res.status(404).json({ error: 'Food record not found' })

    await deletedFood.destroy()
    res.json({ message: 'Food record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
