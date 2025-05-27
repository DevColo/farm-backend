// models/Cow.js
module.exports = (sequelize, DataTypes) => {
  const Cow = sequelize.define('Cow', {
    ear_tag: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    date_of_birth: DataTypes.STRING,
    type: DataTypes.STRING,
    breed: DataTypes.STRING,
    herd: DataTypes.STRING,
    description: DataTypes.STRING,
    status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  })

  Cow.associate = (models) => {
    Cow.belongsTo(models.Pasture, {
      foreignKey: 'pasture_id',
      as: 'pasture',
    })
    Cow.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    })
    Cow.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    })
  }

  return Cow
}
