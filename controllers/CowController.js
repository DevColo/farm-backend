// controllers/CowController.js

const { Cow, Pasture, User, Feeding, Medication } = require('../models')
const fs = require('fs')
const { Op } = require('sequelize')

// Create cow
exports.createCow = async (req, res) => {
  try {
    const {
      name,
      ear_tag,
      date_of_birth,
      type,
      male_type,
      given_birth,
      breed,
      herd,
      from_location,
      description,
      pasture_id,
      status
    } = req.body

    const userId = req.user.id

    // Check if a cow with same ear tag exists in same pasture
    const existingCow = await Cow.findOne({
      where: {
        ear_tag,
        // optionally pasture_id
      }
    })

    if (existingCow) {
      return res.status(400).json({ error: 'Cow with this ear tag already exists in this pasture.' })
    }

    // If file uploaded, get path
    let imagePath = null
    if (req.file) {
      imagePath = req.file.path // This is the server path to the file, e.g., 'uploads/cows/1234567890.jpg'
    }

    const newCow = await Cow.create({
      name,
      ear_tag,
      date_of_birth,
      type,
      male_type,
      given_birth,
      breed,
      herd,
      from_location,
      description,
      image: imagePath,
      pasture_id,
      status,
      user_id: userId,
    })

    res.status(201).json(newCow)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all cows with pasture and user info
exports.getAllCows = async (req, res) => {
  try {
    const cows = await Cow.findAll({
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture'],
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name'],
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name'],
        },
      ],
    });

    const cowsWithDetails = await Promise.all(
      cows.map(async (cow) => {
        const feedings = await Feeding.findAll({
          where: { pasture_id: cow.pasture_id },
        });

        const medications = await Medication.findAll({
          where: { cow_id: cow.id },
        });

        return {
          ...cow.toJSON(),
          feedings,
          medications,
        };
      })
    );

    res.json(cowsWithDetails);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get cow by ID
exports.getCowById = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id, {
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture']
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    })
    if (!cow) return res.status(404).json({ error: 'Cow not found' })
    res.json(cow)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update cow by ID
exports.updateCow = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id)
    if (!cow) return res.status(404).json({ error: 'Cow not found' })

    const {
      name,
      ear_tag,
      date_of_birth,
      type,
      male_type,
      given_birth,
      breed,
      herd,
      from_location,
      description,
      pasture_id,
      status
    } = req.body

    // Check if another cow already has this ear_tag
    const existingCow = await Cow.findOne({
      where: {
        ear_tag,
        id: { [Op.ne]: cow.id } // Exclude current cow by ID
      }
    })

    if (existingCow) {
      return res.status(400).json({ error: 'Another cow with this ear tag already exists.' })
    }

    let imagePath = cow.image

    if (req.body.remove_image === '1' && cow.image && fs.existsSync(cow.image)) {
      fs.unlinkSync(cow.image)
      imagePath = null
    }

    if (req.file) {
      if (cow.image && fs.existsSync(cow.image)) {
        fs.unlinkSync(cow.image)
      }
      imagePath = req.file.path
    }

    await cow.update({
      name,
      ear_tag,
      date_of_birth,
      type,
      male_type,
      given_birth,
      breed,
      herd,
      from_location,
      description,
      pasture_id,
      status,
      image: imagePath,
      updated_by: req.user.id
    })

    res.json(cow)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Delete cow by ID
exports.deleteCow = async (req, res) => {
  try {
    const cow = await Cow.findByPk(req.params.id)
    if (!cow) return res.status(404).json({ error: 'Cow not found' })

    await cow.destroy()
    res.json({ message: 'Cow deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get all cows with pasture and user info based on the pasture id
exports.getPastureCows = async (req, res) => {
  try {
    const pastureId = req.params.id;

    // Get pasture info
    const pasture = await Pasture.findOne({
      where: { id: pastureId },
      attributes: ['id', 'pasture']
    });

    if (!pasture) {
      return res.status(404).json({ error: 'Pasture not found' });
    }

    // Get cows in that pasture
    const cows = await Cow.findAll({
      where: { pasture_id: pastureId },
      include: [
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    });

    // Send structured response
    res.json({
      pasture,
      cows
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all cows with pasture and user info based on the breed
exports.getBreedCows = async (req, res) => {
  try {
    const breed = req.params.breed;

    // Get cows in that pasture
    const cows = await Cow.findAll({
      where: { breed: breed },
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture']
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    });

    // Send structured response
    res.json({
      cows
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

  // Get all cows with pasture and user info based on the gender
exports.getGenderCows = async (req, res) => {
  try {
    const type = req.params.gender;

    // Get cows in that pasture
    const cows = await Cow.findAll({
      where: { type: type },
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture']
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    });

    // Send structured response
    res.json({
      cows
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

  // Get all cows with pasture and user info based on the class
exports.getClassCows = async (req, res) => {
  try {
    const ageClass = req.params.class;
console.log(ageClass);
    // Fetch all cows with necessary data
    const cows = await Cow.findAll({
      include: [
        {
          model: Pasture,
          as: 'pasture',
          attributes: ['id', 'pasture']
        },
        {
          model: User,
          as: 'owner',
          attributes: ['id', 'first_name']
        },
        {
          model: User,
          as: 'updatedBy',
          attributes: ['id', 'first_name']
        }
      ]
    });

    // Filter based on age class
    const filteredCows = cows.filter(cow => {
      if (!cow.date_of_birth) return false;

      const dob = new Date(cow.date_of_birth);
      const now = new Date();
      let months = (now.getFullYear() - dob.getFullYear()) * 12 + (now.getMonth() - dob.getMonth());

      if (now.getDate() < dob.getDate()) months--;

      const ageClass = months >= 1 && months <= 11
          ? 'Calf'
          : months >= 12 && months <= 23
          ? 'Yearling'
          : cow.given_birth == '1'
          ? 'Heifer'
          : 'Adult';

      return ageClass === req.params.class;
    });

    res.json({ cows: filteredCows });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
