'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('medications', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      cow_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        references: {
          model: 'cows',
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE',
      },
      medication: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      disease: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      medication_date: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      diagnosis: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      symptoms: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      symptoms_date: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'users',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      },
      updated_by: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'users',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      },
      created_at: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      },
      updated_at: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.fn('NOW')
      }
    });
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('medications');
  },
};
