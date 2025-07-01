// models/Medication.js
module.exports = (sequelize, DataTypes) => {
  const Medication = sequelize.define('Medication', {
    medication: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    reason: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    medication_date: {
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
    tableName: 'medications',
    timestamps: true,
    underscored: true,
  });

  Medication.associate = (models) => {
    Medication.belongsTo(models.Cow, {
      foreignKey: 'cow_id',
      as: 'cow',
    });

    Medication.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    Medication.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return Medication;
};
