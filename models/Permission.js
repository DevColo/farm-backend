// models/Permission.js
const { DataTypes } = require('sequelize');

module.exports = (sequelize) => {
  return sequelize.define('Permission', {
    name: { type: DataTypes.STRING, allowNull: false, unique: true }
  }, {
    timestamps: true,
    underscored: true
  });
};
