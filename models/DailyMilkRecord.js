// models/DailyMilkRecord.js
module.exports = (sequelize, DataTypes) => {
  const DailyMilkRecord = sequelize.define('DailyMilkRecord', {
    morning_qty: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    evening_qty: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    record_date: {
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
    tableName: 'daily_milk_records',
    timestamps: true,
    underscored: true,
  });

  DailyMilkRecord.associate = (models) => {
    DailyMilkRecord.belongsTo(models.Cow, {
      foreignKey: 'cow_id',
      as: 'cow',
    });

    DailyMilkRecord.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    DailyMilkRecord.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return DailyMilkRecord;
};
