// models/User.js
const { DataTypes } = require('sequelize');
const bcrypt = require('bcryptjs');

module.exports = (sequelize) => {
  const User = sequelize.define('User', {
    first_name: { type: DataTypes.STRING, allowNull: false },
    other_name: { type: DataTypes.STRING },
    last_name: { type: DataTypes.STRING, allowNull: false },
    address: { type: DataTypes.STRING },
    photo: { type: DataTypes.STRING },
    phone: { type: DataTypes.STRING, allowNull: false, unique: true },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: { isEmail: true }
    },
    password: { type: DataTypes.STRING, allowNull: false }
  }, {
    timestamps: true,
    underscored: true
  });

  User.beforeCreate(async (user) => {
    user.password = await bcrypt.hash(user.password, 10);
  });

  User.beforeUpdate(async (user) => {
    if (user.changed('password')) {
      user.password = await bcrypt.hash(user.password, 10);
    }
  });

  return User;
};
