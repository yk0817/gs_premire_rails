const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
module.exports = environment
// https://qiita.com/tocomi/items/0e1522418d0a21a6b291
environment.loaders.get('vue').use[0].options.extractCSS = false
