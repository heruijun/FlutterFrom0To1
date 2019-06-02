const mongoose = require('mongoose')
const Schema = mongoose.Schema

const companyDetailSchema = new Schema({
  id: {
    unique: true,
    type: String
  },
  inc: String,
  companyImgsResult: [String],
  tagsResult: [String],

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

companyDetailSchema.pre('save', function (next) {
  if (this.isNew) {
    this.meta.createdAt = this.meta.updatedAt = Date.now()
  } else {
    this.meta.updatedAt = Date.now()
  }

  next()
})

mongoose.model('CompanyDetail', companyDetailSchema)