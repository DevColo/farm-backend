/*
* controllers/CustomerController
*/
const { Customer, User, MilkSales, CowSales } = require('../models')
const { Op } = require('sequelize')

// Create Customer
exports.createCustomer = async (req, res) => {
  try {
    const { first_name, last_name, phone, email } = req.body
    const userId = req.user.id

    const newCustomer = await Customer.create({
      first_name,
      last_name,
      phone,
      email,
      user_id: userId,
    })

    res.status(201).json(newCustomer)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all Customer Records
exports.getCustomers = async (req, res) => {
  try {
    const customers = await Customer.findAll({
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
          model: MilkSales,
          required: false,
        },
        {
          model: CowSales,
          required: false,
        }
      ]
    });

    res.json(customers);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get a specific Customer by ID
exports.getCustomerById = async (req, res) => {
  try {
    const customer = await Customer.findByPk(req.params.id, {
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
        },
         {
          model: MilkSales,
          required: false,
        },
        {
          model: CowSales,
          required: false,
        }
      ]
    })

    if (!customer) return res.status(404).json({ error: 'Customer not found' })
    res.json(customer)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update Customer Record by ID
exports.updateCustomer = async (req, res) => {
  try {
    const updatedCustomer = await Customer.findByPk(req.params.id)
    if (!updatedCustomer) return res.status(404).json({ error: 'Customer record not found' })

    const { first_name, last_name, phone, email } = req.body

    await updatedCustomer.update({
      first_name,
      last_name,
      phone,
      email,
      updated_by: req.user.id
    })

    res.json(updatedCustomer)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete Customer Record by ID
exports.deleteCustomer = async (req, res) => {
  try {
    const deletedCustomer = await Customer.findByPk(req.params.id)
    if (!deletedCustomer) return res.status(404).json({ error: 'Customer record not found' })

    await deletedCustomer.destroy()
    res.json({ message: 'Customer record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
