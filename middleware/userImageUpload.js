// middleware/userImageUpload
const multer = require('multer')
const path = require('path')

// Set storage engine
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/users/') 
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
    cb(null, uniqueSuffix + path.extname(file.originalname))
  }
})

// File filter (optional) to accept only images
function fileFilter(req, file, cb) {
  const filetypes = /jpeg|jpg|png|gif/
  const extname = filetypes.test(path.extname(file.originalname).toLowerCase())
  const mimetype = filetypes.test(file.mimetype)

  if (mimetype && extname) {
    return cb(null, true)
  } else {
    cb(new Error('Only images are allowed'))
  }
}

const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB limit
  fileFilter
})

module.exports = upload
