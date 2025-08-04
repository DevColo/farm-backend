// models/CowSales.js
module.exports = (sequelize, DataTypes) => {
  const CowSales = sequelize.define('CowSales', {
    cow_id: {
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
    tableName: 'cow_sales',
    timestamps: true,
    underscored: true,
  });

  CowSales.associate = (models) => {
    CowSales.belongsTo(models.Cow, {
      foreignKey: 'cow_id',
      as: 'cow',
    });

    CowSales.belongsTo(models.Customer, {
      foreignKey: 'customer_id',
      as: 'customer',
    });

    CowSales.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    CowSales.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return CowSales;
};
