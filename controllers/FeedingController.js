const { Feeding, Cow, Pasture, User, Food } = require('../models')
const { Op } = require('sequelize')

// Create Feeding
exports.createFeeding = async (req, res) => {
  try {
    const { food_id, quantity, fed_date, pasture_id } = req.body;
    const userId = req.user.id;

    // 1️⃣ Get the food stock from foods table
    const food = await Food.findOne({ where: { id: food_id } });
    if (!food) {
      return res.status(404).json({ error: "Food not found" });
    }

    // 2️⃣ Calculate already fed quantity for that food
    const totalFed = await Feeding.sum("quantity", { where: { food_id } }) || 0;

    // 3️⃣ Calculate remaining stock
    const remainingStock = food.quantity - totalFed;

    // 4️⃣ Check if requested quantity is available
    if (quantity > remainingStock) {
      return res.status(400).json({
        error: `Not enough stock. Remaining stock: ${remainingStock}`,
      });
    }

    // 5️⃣ Create the feeding record
    const newFeeding = await Feeding.create({
      food_id,
      quantity,
      fed_date,
      pasture_id,
      user_id: userId,
    });

    res.status(201).json(newFeeding);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// exports.createFeeding = async (req, res) => {
//   try {
//     const { food_id, quantity, fed_date, pasture_id } = req.body
//     const userId = req.user.id

//     const newFeeding = await Feeding.create({
//       food_id,
//       quantity,
//       fed_date,
//       pasture_id,
//       user_id: userId,
//     })

//     res.status(201).json(newFeeding)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//   }
// }

// Get all Feeding Records
exports.getFeedings = async (req, res) => {
  try {
    const feedings = await Feeding.findAll({
      include: [
        {
          model: Food,
          as: 'food',
          attributes: ['id', 'food', 'food_type']
        },
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
    res.json(feedings)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Get a specific Feeding by ID
exports.getFeedingById = async (req, res) => {
  try {
    const feeding = await Feeding.findByPk(req.params.id, {
      include: [
        {
          model: Food,
          as: 'food',
          attributes: ['id', 'food', 'food_type']
        },
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

    if (!feeding) return res.status(404).json({ error: 'Feeding record not found' })
    res.json(feeding)
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}

// Update Feeding Record by ID
exports.updateFeeding = async (req, res) => {
  try {
    const feeding = await Feeding.findByPk(req.params.id);
    if (!feeding) {
      return res.status(404).json({ error: "Feeding record not found" });
    }

    const { food_id, quantity, fed_date, pasture_id } = req.body;
    const userId = req.user.id;

    // 1️⃣ Get the food stock from foods table
    const food = await Food.findOne({ where: { id: food_id } });
    if (!food) {
      return res.status(404).json({ error: "Food not found" });
    }

    // 2️⃣ Restore the old quantity back to stock if food_id is the same
    let restoredStock = Number(food.quantity);
    if (feeding.food_id === food_id) {
      restoredStock += Number(feeding.quantity); // put back what was used before
    } else {
      // If food type changes, restore stock for old food
      const oldFood = await Food.findOne({ where: { id: feeding.food_id } });
      if (oldFood) {
        await oldFood.update({ quantity: Number(oldFood.quantity) + Number(feeding.quantity) });
      }
    }

    // 3️⃣ Check stock availability
    if (quantity > restoredStock) {
      return res.status(400).json({
        error: `Not enough stock. Remaining stock: ${restoredStock}`,
      });
    }

    // 4️⃣ Update feeding record
    await feeding.update({
      food_id,
      quantity,
      fed_date,
      pasture_id,
      updated_by: userId,
    });

    // 5️⃣ Deduct the new quantity from the restored stock
    await Food.update(
      { quantity: restoredStock - quantity },
      { where: { id: food_id } }
    );

    res.json(feeding);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// exports.updateFeeding = async (req, res) => {
//   try {
//     const feeding = await Feeding.findByPk(req.params.id)
//     if (!feeding) return res.status(404).json({ error: 'Feeding record not found' })

//     const { food_id, quantity, fed_date, pasture_id } = req.body

//     await feeding.update({
//       food_id,
//       quantity,
//       fed_date,
//       pasture_id,
//       updated_by: req.user.id
//     })

//     res.json(feeding)
//   } catch (error) {
//     res.status(500).json({ error: error.message })
//   }
// }

// Delete Feeding Record by ID
exports.deleteFeeding = async (req, res) => {
  try {
    const feeding = await Feeding.findByPk(req.params.id)
    if (!feeding) return res.status(404).json({ error: 'Feeding record not found' })

    await feeding.destroy()
    res.json({ message: 'Feeding record deleted successfully' })
  } catch (error) {
    res.status(500).json({ error: error.message })
  }
}
