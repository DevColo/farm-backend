const { CowSales, Cow, Customer, User } = require('../models')
const { Op } = require('sequelize')

// Create CowSales
exports.createCowSales = async (req, res) => {
  try {
    const { cow_id, customer_id, unit_price, sales_date } = req.body;
    const userId = req.user.id;

    const newCowSales = await CowSales.create({
      cow_id,
      customer_id,
      quantity: 1,
      unit_price,
      sales_date,
      user_id: userId,
    });

    if (cow_id) {
      const cow = await Cow.findByPk(cow_id)
      if (cow) {
        await cow.update({ status: 'Sold' })
      }
    }

    res.status(201).json(newCowSales);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all CowSales Records
exports.getCowSales = async (req, res) => {
  try {
    const cowSales = await CowSales.findAll({
      include: [
        {
          model: Cow,
          as: 'cow',
          attributes: ['id', 'ear_tag']
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
    res.json(cowSales)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update CowSales Record by ID
exports.updateCowSales = async (req, res) => {
  try {
    const cowSalesRecord = await CowSales.findByPk(req.params.id);
    if (!cowSalesRecord) {
      return res.status(404).json({ error: 'Cow Sales record not found' });
    }

    const { cow_id, customer_id, unit_price, sales_date } = req.body;

    await cowSalesRecord.update({
      cow_id,
      customer_id,
      quantity: 1,
      unit_price,
      sales_date,
      updated_by: req.user.id,
    });

    res.json(cowSalesRecord);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};


// Delete CowSales Record by ID
exports.deleteCowSales = async (req, res) => {
  try {
    const deletedCowSales = await CowSales.findByPk(req.params.id)
    if (!deletedCowSales) return res.status(404).json({ error: 'Cow Sales record not found' })

    await deletedCowSales.destroy()
    res.json({ message: 'Cow Sales record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
