// models/Cow.js
module.exports = (sequelize, DataTypes) => {
  const Cow = sequelize.define('Cow', {
    name: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    ear_tag: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    date_of_birth: {
      type: DataTypes.DATEONLY,
      allowNull: false,
    },
    type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    breed: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    herd: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    from_location: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    image: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    pasture_id: {
      type: DataTypes.INTEGER,
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
    status: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    given_birth: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    male_type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  }, {
    tableName: 'cows',
    timestamps: true,
    underscored: true,
  });

  Cow.associate = (models) => {
    Cow.belongsTo(models.Pasture, {
      foreignKey: 'pasture_id',
      as: 'pasture',
    });

    Cow.belongsTo(models.User, {
      foreignKey: 'user_id',
      as: 'owner',
    });

    Cow.belongsTo(models.User, {
      foreignKey: 'updated_by',
      as: 'updatedBy',
    });
  };

  return Cow;
};
