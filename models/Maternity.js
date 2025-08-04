// models/Maternity.js
module.exports = (sequelize, DataTypes) => {
  const Maternity = sequelize.define('Maternity', {
    cow_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    bull_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    pregnancy_status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    mating_date: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    birth_date: {
      type: DataTypes.DATEONLY,
      allowNull: true,
    },
    calf_amount: {
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
    tableName: 'maternities',
    timestamps: true,
    underscored: true,
  });

  Maternity.associate = (models) => {
    Maternity.belongsTo(models.Cow, {
      foreignKey: 'cow_id',
      as: 'cow',
    });

    Maternity.belongsTo(models.Cow, {
      foreignKey: 'bull_id',
      as: 'bull',
    });

    Maternity.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    Maternity.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return Maternity;
};
