const mongoose = require('mongoose')
const Schema = mongoose.Schema

const messageSchema = new Schema({
  id: {
    unique: true,
    type: String
  },
  name: String,
  message: String,
  head: String,
  time: String,

  meta: {
    createdAt: {
      type: Date,
      default: Date.now()
    },
    updatedAt: {
      type: Date,
      default: Date.now()
    }
  }
})

messageSchema.pre('save', function (next) {
  if (this.isNew) {
    this.meta.createdAt = this.meta.updatedAt = Date.now()
  } else {
    this.meta.updatedAt = Date.now()
  }

  next()
})

mongoose.model('Message', messageSchema)