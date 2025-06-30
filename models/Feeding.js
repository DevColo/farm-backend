// models/Feeding.js
module.exports = (sequelize, DataTypes) => {
  const Feeding = sequelize.define('Feeding', {
    food: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    quantity: {
      type: DataTypes.STRING,
      allowNull: true,
    },
     fed_date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    cow_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
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
    tableName: 'feedings',
    timestamps: true,
    underscored: true,
  });

  Feeding.associate = (models) => {
    Feeding.belongsTo(models.Cow, {
      foreignKey: 'cow_id',
      as: 'cow',
    });

    Feeding.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    Feeding.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return Feeding;
};
