module.exports = (sequelize, DataTypes) => {
  const Pasture = sequelize.define('Pasture', {
    pasture: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    country: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    updated_by: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    status: {
      type: DataTypes.STRING,
      allowNull: false,
    }
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: true,
    }
  }, {
    tableName: 'pastures',
    timestamps: true,
    underscored: true,
  });

  Pasture.associate = function(models) {
    Pasture.belongsTo(models.User, {
      foreignKey: 'user_id',
      onDelete: 'CASCADE'
    });
  };

  return Pasture;
};
