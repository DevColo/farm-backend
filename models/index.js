// models/index.js
const { Sequelize, DataTypes } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: 'mysql',
    logging: false,
  }
);

// Initialize models
const db = {}

db.sequelize = sequelize
db.Sequelize = Sequelize

db.User = require('./User')(sequelize, DataTypes)
db.Role = require('./Role')(sequelize, DataTypes)
db.Permission = require('./Permission')(sequelize, DataTypes)
db.Pasture = require('./Pasture')(sequelize, DataTypes)
db.Cow = require('./Cow')(sequelize, DataTypes)
db.DailyMilkRecord = require('./DailyMilkRecord')(sequelize, DataTypes)
db.Food = require('./Food')(sequelize, DataTypes)
db.Feeding = require('./Feeding')(sequelize, DataTypes)
db.Medication = require('./Medication')(sequelize, DataTypes)
db.Maternity = require('./Maternity')(sequelize, DataTypes)
db.Customer = require('./Customer')(sequelize, DataTypes)
db.MilkSales = require('./MilkSales')(sequelize, DataTypes)
db.CowSales = require('./CowSales')(sequelize, DataTypes)
db.ClinicalCare = require('./ClinicalCare')(sequelize, DataTypes)

// Define relationships
db.User.belongsToMany(db.Role, { through: 'user_roles' })
db.Role.belongsToMany(db.User, { through: 'user_roles' })

db.Role.belongsToMany(db.Permission, { through: 'role_permissions' })
db.Permission.belongsToMany(db.Role, { through: 'role_permissions' })

db.Food.hasMany(db.Feeding, { foreignKey: 'food_id' });
db.Feeding.belongsTo(db.Food, { foreignKey: 'food_id' });

// A Customer can have many MilkSales
db.Customer.hasMany(db.MilkSales, { foreignKey: 'customer_id' });
db.MilkSales.belongsTo(db.Customer, { foreignKey: 'customer_id' });

// A Customer can have many CowSales
db.Customer.hasMany(db.CowSales, { foreignKey: 'customer_id' });
db.CowSales.belongsTo(db.Customer, { foreignKey: 'customer_id' });

// Register model associations if they exist
Object.values(db).forEach((model) => {
  if (model.associate) {
    model.associate(db)
  }
})

module.exports = db
