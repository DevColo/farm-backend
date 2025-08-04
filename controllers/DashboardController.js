// controllers/DashboardController.js

const { Cow, Pasture, User, DailyMilkRecord, Customer, MilkSales, CowSales } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')
const { sequelize } = require('../models')

// Get dashboard stats
exports.getDashboardStats = async (req, res) => {
  try {
    const total_cows = await Cow.count()
    const total_pastures = await Pasture.count()
    const total_customers = await Customer.count()

    const morning_qty = await DailyMilkRecord.sum('morning_qty')
    const evening_qty = await DailyMilkRecord.sum('evening_qty')
    const total_qty = morning_qty + evening_qty;

    const total_revenue = total_qty * 1000;

    // Convert month numbers to names in JavaScript
    const monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    // Group by cows by year
    const cows = await Cow.findAll({
      attributes: [
        [sequelize.fn('YEAR', sequelize.col('date_of_birth')), 'year'],
        [sequelize.fn('COUNT', sequelize.col('id')), 'count']
      ],
      group: [sequelize.fn('YEAR', sequelize.col('date_of_birth'))],
      order: [[sequelize.fn('YEAR', sequelize.col('date_of_birth')), 'ASC']],
      raw: true,
    });

    const cowFormattedData = cows.map(record => ({
      year: record.year,
      count: record.count
    }));

    // Group by pastures by year
    const pastures = await Pasture.findAll({
      attributes: [
        [sequelize.fn('YEAR', sequelize.col('created_at')), 'year'],
        [sequelize.fn('COUNT', sequelize.col('id')), 'count']
      ],
      group: [sequelize.fn('YEAR', sequelize.col('created_at'))],
      order: [[sequelize.fn('YEAR', sequelize.col('created_at')), 'ASC']],
      raw: true,
    });

    const pastureFormattedData = pastures.map(record => ({
      year: record.year,
      count: record.count
    }));

    // Group by customers by year
    const customers = await Customer.findAll({
      attributes: [
        [sequelize.fn('YEAR', sequelize.col('created_at')), 'year'],
        [sequelize.fn('COUNT', sequelize.col('id')), 'count']
      ],
      group: [sequelize.fn('YEAR', sequelize.col('created_at'))],
      order: [[sequelize.fn('YEAR', sequelize.col('created_at')), 'ASC']],
      raw: true,
    });

    const customerFormattedData = customers.map(record => ({
      year: record.year,
      count: record.count
    }));

    // Group by month and sum milk quantity
    const monthlyMilk = await DailyMilkRecord.findAll({
      attributes: [
        [sequelize.fn('MONTH', sequelize.col('record_date')), 'month_number'],
        [sequelize.fn('YEAR', sequelize.col('record_date')), 'year'],
        [sequelize.fn('SUM', sequelize.literal('morning_qty + evening_qty')), 'total_qty'],
      ],
      group: [
        sequelize.fn('YEAR', sequelize.col('record_date')),
        sequelize.fn('MONTH', sequelize.col('record_date')),
      ],
      order: [
        [sequelize.fn('YEAR', sequelize.col('record_date')), 'ASC'],
        [sequelize.fn('MONTH', sequelize.col('record_date')), 'ASC'],
      ],
      raw: true,
    });

    const milkRecordFormattedData = monthlyMilk.map(record => ({
      month: monthNames[record.month_number - 1],
      year: record.year,
      total_qty: record.total_qty
    }));

    // Group by month and sum milk sales
    const monthlyMilkSales = await MilkSales.findAll({
      attributes: [
        [sequelize.fn('MONTH', sequelize.col('sales_date')), 'month_number'],
        [sequelize.fn('YEAR', sequelize.col('sales_date')), 'year'],
        // Calculate total revenue (quantity * unit_price)
        [sequelize.fn('SUM', sequelize.literal('quantity * unit_price')), 'total_revenue'],
        // Optionally include total quantity sold
        [sequelize.fn('SUM', sequelize.col('quantity')), 'total_qty']
      ],
      group: [
        sequelize.fn('YEAR', sequelize.col('sales_date')),
        sequelize.fn('MONTH', sequelize.col('sales_date')),
      ],
      order: [
        [sequelize.fn('YEAR', sequelize.col('sales_date')), 'ASC'],
        [sequelize.fn('MONTH', sequelize.col('sales_date')), 'ASC'],
      ],
      raw: true,
    });

    const milkSalesFormattedData = monthlyMilkSales.map(record => ({
      month: monthNames[record.month_number - 1],
      year: record.year,
      total_qty: parseFloat(record.total_qty) || 0,
      total_revenue: parseFloat(record.total_revenue) || 0
    }));

    // Group by month and sum cow sales
    const monthlyCowSales = await CowSales.findAll({
      attributes: [
        [sequelize.fn('MONTH', sequelize.col('sales_date')), 'month_number'],
        [sequelize.fn('YEAR', sequelize.col('sales_date')), 'year'],
        // Calculate total revenue (quantity * unit_price)
        [sequelize.fn('SUM', sequelize.literal('quantity * unit_price')), 'total_revenue'],
        // Optionally include total quantity sold
        [sequelize.fn('SUM', sequelize.col('quantity')), 'total_qty']
      ],
      group: [
        sequelize.fn('YEAR', sequelize.col('sales_date')),
        sequelize.fn('MONTH', sequelize.col('sales_date')),
      ],
      order: [
        [sequelize.fn('YEAR', sequelize.col('sales_date')), 'ASC'],
        [sequelize.fn('MONTH', sequelize.col('sales_date')), 'ASC'],
      ],
      raw: true,
    });

    const cowSalesFormattedData = monthlyCowSales.map(record => ({
      month: monthNames[record.month_number - 1],
      year: record.year,
      total_qty: parseFloat(record.total_qty) || 0,
      total_revenue: parseFloat(record.total_revenue) || 0
    }));

    res.json({
      'cows': cowFormattedData,
      'cows_count': total_cows,
      'pastures': pastureFormattedData,
      'pastures_count': total_pastures,
      'total_qty': total_qty,
      'total_revenue': total_revenue,
      'monthly_milk': milkRecordFormattedData,
      'customers_count': total_customers,
      'customers': customerFormattedData,
      'milk_sales': milkSalesFormattedData,
      'cow_sales': cowSalesFormattedData,
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