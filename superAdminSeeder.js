// seed.js
const { sequelize, User, Role } = require('./models');
const bcrypt = require('bcryptjs');

async function seed() {
  try {
    await sequelize.sync({ alter: true }); // Ensures tables exist

    // 1. Create or find role
    const [adminRole] = await Role.findOrCreate({
      where: { name: 'superadmin' }
    });

    // 2. Create user
    //const hashedPassword = await bcrypt.hash('12345678', 10);
    const [adminUser] = await User.findOrCreate({
      where: { email: 'admin@admin.com' },
      defaults: {
        first_name: 'Thomas',
        last_name: 'Gayflor Jr',
        other_name: '',
        address: 'Kigali',
        photo: '',
        phone: '1234567890',
        password: '12345678'
      }
    });

    // 3. Assign role to user
    await adminUser.addRole(adminRole);

    console.log('Admin user with role seeded successfully');
    process.exit();
  } catch (error) {
    console.error('Error seeding user with role:', error);
    process.exit(1);
  }
}

seed();
