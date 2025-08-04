// controllers/DailyMilkRecordController.js

const { DailyMilkRecord, Cow, Pasture, User } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')

// Create Daily Milk Record 
exports.createMilkRecord = async (req, res) => {
  try {
    const {
      morning_qty,
      evening_qty,
      record_date,
      unit_price,
      currency,
      // cow_id,
    } = req.body

    const userId = req.user.id

    // Check if a Daily Milk Record with same Cow exists
    const existingDailyMilkRecord = await DailyMilkRecord.findOne({
      where: {
        record_date,
      }
    })

    if (existingDailyMilkRecord) {
      return res.status(400).json({ error: 'Daily Milk Record for this date already exists, try another.' })
    }

    const newDailyMilkRecord = await DailyMilkRecord.create({
      morning_qty,
      evening_qty,
      record_date,
      unit_price,
      currency,
      // cow_id,
      user_id: userId,
    })

    res.status(201).json(newDailyMilkRecord)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all Daily Milk Records with cows and user info
exports.getMilkRecords = async (req, res) => {
  try {
    const milkRecords = await DailyMilkRecord.findAll({
      include: [
        // {
        //   model: Cow,
        //   as: 'cow',
        //   attributes: ['id', 'name', 'ear_tag']
        // },
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
    res.json(milkRecords)
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

// Update Milk Record by ID
exports.updateMilkRecord = async (req, res) => {
  try {
    const milkRecord = await DailyMilkRecord.findByPk(req.params.id)
    if (!milkRecord) return res.status(404).json({ error: 'Daily Milk Record not found' })

    const {
      morning_qty,
      evening_qty,
      record_date,
      unit_price,
      currency,
      // cow_id
    } = req.body

    const existingDailyMilkRecord = await DailyMilkRecord.findOne({
      where: {
        record_date,
        id: { [Op.ne]: milkRecord.id }
      }
    })

    if (existingDailyMilkRecord) {
      return res.status(400).json({ error: 'Milk record for this date already exists.' })
    }

    await milkRecord.update({
      morning_qty,
      evening_qty,
      record_date,
      unit_price,
      currency,
      // cow_id,
      updated_by: req.user.id
    })

    res.json(milkRecord)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete Milk Record by ID
exports.deleteMilkRecord = async (req, res) => {
  try {
    const milkRecord = await DailyMilkRecord.findByPk(req.params.id)
    if (!milkRecord) return res.status(404).json({ error: 'Daily Milk Record not found' })

    await milkRecord.destroy()
    res.json({ message: 'Daily Milk Record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
