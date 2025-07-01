/*
* controllers/AuthController
*/
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { User, Role, UserRole } = require('../models'); // adjust imports as needed
const JWT_SECRET = process.env.JWT_SECRET;

exports.login = async (req, res) => {
  const { email, password } = req.body || {};

  if (!email || !password) {
    return res.status(400).json({ message: 'Email and password are required.' });
  }

  try {
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(401).json({ message: 'Invalid email or password' });
    }

    //const passwordMatch = await bcrypt.compare('12345678', user.password);
    //const passwordMatch = await bcrypt.compare(password.trim(), user.password.trim());
    const passwordMatch = await bcrypt.compare(password, user.password);

    if (!passwordMatch) {
      return res.status(401).json({ message: 'You entered a wrong password, try again.',hash: user.password,passwordMatch: passwordMatch });
    }

    // Get user roles (assuming associations are set)
    const roles = await user.getRoles(); // Sequelize association
    const roleNames = roles.map(role => role.name);

    const token = jwt.sign(
      {
        id: user.id,
        email: user.email,
        roles: roleNames,
      },
      JWT_SECRET,
      { expiresIn: '1d' }
    );

    res.json({
      token,
      user: {
        id: user.id,
        // name: `${user.first_name} ${user.last_name}`,
        first_name: user.first_name,
        other_name: user.other_name,
        last_name: user.last_name,
        phone: user.phone,
        address: user.address,
        photo: user.photo,
        email: user.email,
        roles: roleNames,
      },
    });
  } catch (err) {
    console.error('Login Error:', err);
    res.status(500).json({ message: 'Internal server error' });
  }
};
