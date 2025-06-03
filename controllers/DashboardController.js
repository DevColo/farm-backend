// controllers/DashboardController.js

const { Cow, Pasture, User, DailyMilkRecord } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')

// Get dashboard stats
exports.getDashboardStats = async (req, res) => {
  try {
    const cows = await Cow.count()
    const pastures = await Pasture.count()

    const morning_qty = await DailyMilkRecord.sum('morning_qty')
    const evening_qty = await DailyMilkRecord.sum('evening_qty')
    const total_qty = morning_qty + evening_qty;

    const total_revenue = total_qty * 1000;

    res.json({
      'cows_count': cows,
      'pastures_count': pastures,
      'total_qty': total_qty,
      'total_revenue': total_revenue,
    })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get dashboard data
exports.getDashboardData = async (req, res) => {
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