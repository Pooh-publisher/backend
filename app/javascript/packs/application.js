// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("bootstrap")
require("@fortawesome/fontawesome-free/js/all.js");
require("bootstrap/scss/bootstrap.scss");
require("@fortawesome/fontawesome-free/css/all.css");

let stylesheetsContext = require.context('../stylesheets/', true, /\.scss$/)
for(let key of stylesheetsContext.keys()) { stylesheetsContext(key) }

let imagesContext = require.context('../images/', true)
for(let key of imagesContext.keys()) { imagesContext(key) }
