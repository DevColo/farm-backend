// models/Food.js
module.exports = (sequelize, DataTypes) => {
  const Food = sequelize.define('Food', {
    food: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    quantity: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    description: {
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
    tableName: 'foods',
    timestamps: true,
    underscored: true,
  });

  Food.associate = (models) => {
    Food.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    Food.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return Food;
};
