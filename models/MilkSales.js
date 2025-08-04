// models/MilkSales.js
module.exports = (sequelize, DataTypes) => {
  const MilkSales = sequelize.define('MilkSales', {
    milk_record_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    customer_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    quantity: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    unit_price: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    sales_date: {
      type: DataTypes.DATEONLY,
      allowNull: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    updated_by: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
  }, {
    tableName: 'milk_sales',
    timestamps: true,
    underscored: true,
  });

  MilkSales.associate = (models) => {
    MilkSales.belongsTo(models.DailyMilkRecord, {
      foreignKey: 'milk_record_id',
      as: 'milk_record',
    });

    MilkSales.belongsTo(models.Customer, {
      foreignKey: 'customer_id',
      as: 'customer',
    });

    MilkSales.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    MilkSales.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return MilkSales;
};
