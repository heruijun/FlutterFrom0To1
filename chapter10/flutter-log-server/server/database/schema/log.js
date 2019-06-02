const mongoose = require('mongoose')
const Schema = mongoose.Schema

const logSchema = new Schema({
  id: {
    unique: true,
    type: String
  },
  device: String,
  message: String,
  cause: String,
  trace: [{
    library: String,
    method: String,
    line: Number,
    class: String,
  }],

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

logSchema.pre('save', function (next) {
  if (this.isNew) {
    this.meta.createdAt = this.meta.updatedAt = Date.now()
  } else {
    this.meta.updatedAt = Date.now()
  }

  next()
})

mongoose.model('FlutterLog', logSchema)