// models/Customer.js
module.exports = (sequelize, DataTypes) => {
  const Customer = sequelize.define('Customer', {
    first_name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    last_name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    email: {
      type: DataTypes.STRING,
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
    tableName: 'customers',
    timestamps: true,
    underscored: true,
  });

  Customer.associate = (models) => {
    Customer.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    Customer.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return Customer;
};
