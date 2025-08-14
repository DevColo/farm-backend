// models/ClinicalCare.js
module.exports = (sequelize, DataTypes) => {
  const ClinicalCare = sequelize.define('ClinicalCare', {
    care: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    medicine: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    cow_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    care_date: {
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
    tableName: 'clinical_cares',
    timestamps: true,
    underscored: true,
  });

  ClinicalCare.associate = (models) => {
    ClinicalCare.belongsTo(models.Cow, {
      foreignKey: 'cow_id',
      as: 'cow',
    });

    ClinicalCare.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    ClinicalCare.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return ClinicalCare;
};
