const { MilkSales, DailyMilkRecord, Customer, User } = require('../models')
const { Op } = require('sequelize')

// Create MilkSales
exports.createMilkSales = async (req, res) => {
  try {
    const { milk_record_id, customer_id, quantity, unit_price, sales_date } = req.body;
    const userId = req.user.id;

    // Convert quantity to number for safety
    const saleQuantity = Number(quantity);

    // 1. Get the daily milk record
    const milkRecord = await DailyMilkRecord.findByPk(milk_record_id);
    if (!milkRecord) {
      return res.status(404).json({ error: 'Milk record not found' });
    }

    // 2. Calculate total available milk (morning + evening)
    const totalAvailable = Number(milkRecord.morning_qty) + Number(milkRecord.evening_qty);

    // 3. Get already sold quantity for this milk_record_id
    const totalSold = await MilkSales.sum('quantity', {
      where: { milk_record_id },
    }) || 0;

    // 4. Calculate remaining quantity
    const remaining = totalAvailable - totalSold;

    // 5. Check if requested quantity exceeds remaining quantity
    if (saleQuantity > remaining) {
      return res.status(400).json({
        error: `Insufficient milk available. Remaining quantity: ${remaining}`,
      });
    }

    // 6. Create the sale
    const newMilkSale = await MilkSales.create({
      milk_record_id,
      customer_id,
      quantity: saleQuantity,
      unit_price,
      sales_date,
      user_id: userId,
    });

    res.status(201).json(newMilkSale);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all MilkSales Records
exports.getMilkSales = async (req, res) => {
  try {
    const maternities = await MilkSales.findAll({
      include: [
        {
          model: DailyMilkRecord,
          as: 'milk_record',
          attributes: ['id', 'record_date', 'morning_qty', 'evening_qty']
        },
        {
          model: Customer,
          as: 'customer',
          attributes: ['id', 'first_name', 'last_name']
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
        },
      ]
    })
    res.json(maternities)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update MilkSales Record by ID
exports.updateMilkSales = async (req, res) => {
  try {
    const milkSalesRecord = await MilkSales.findByPk(req.params.id);
    if (!milkSalesRecord) {
      return res.status(404).json({ error: 'MilkSales record not found' });
    }

    const { milk_record_id, customer_id, quantity, unit_price, sales_date } = req.body;
    const saleQuantity = Number(quantity);

    // 1. Get the Daily Milk Record
    const milkRecord = await DailyMilkRecord.findByPk(milk_record_id);
    if (!milkRecord) {
      return res.status(404).json({ error: 'Milk record not found' });
    }

    // 2. Calculate total available milk (morning + evening)
    const totalAvailable = Number(milkRecord.morning_qty) + Number(milkRecord.evening_qty);

    // 3. Calculate total already sold for this milk_record_id (excluding current sale)
    const totalSold = await MilkSales.sum('quantity', {
      where: {
        milk_record_id,
        id: { [Op.ne]: milkSalesRecord.id }, // Exclude the current record
      },
    }) || 0;

    // 4. Calculate remaining quantity
    const remaining = totalAvailable - totalSold;

    // 5. Validate if updated quantity exceeds remaining
    if (saleQuantity > remaining) {
      return res.status(400).json({
        error: `Insufficient milk available. Remaining quantity: ${remaining}`,
      });
    }

    // 6. Update the MilkSales record
    await milkSalesRecord.update({
      milk_record_id,
      customer_id,
      quantity: saleQuantity,
      unit_price,
      sales_date,
      updated_by: req.user.id,
    });

    res.json(milkSalesRecord);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


// Delete MilkSales Record by ID
exports.deleteMilkSales = async (req, res) => {
  try {
    const deletedMilkSales = await MilkSales.findByPk(req.params.id)
    if (!deletedMilkSales) return res.status(404).json({ error: 'MilkSales record not found' })

    await deletedMilkSales.destroy()
    res.json({ message: 'MilkSales record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
