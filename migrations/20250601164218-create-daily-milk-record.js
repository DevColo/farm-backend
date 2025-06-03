'use strict';

module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.createTable('daily_milk_records', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      morning_qty: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      evening_qty: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      record_date: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      cow_id: {
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
          model: 'cows',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
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

  async down (queryInterface, Sequelize) {
    await queryInterface.dropTable('daily_milk_records');
  }
};

