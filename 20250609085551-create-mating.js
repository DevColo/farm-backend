'use strict';

module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('matings', {
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
      food: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      fed_date: {
        type: Sequelize.DATEONLY,
        allowNull: false,
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
    await queryInterface.dropTable('matings');
  },
};
