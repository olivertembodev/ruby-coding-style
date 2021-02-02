// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("packs/example")
require("packs/jquery.easing")
require('packs/sb-admin-2')
require('packs/jquery.dataTables')
require('packs/dataTables.bootstrap4')
require('packs/datatables-demo')
require('packs/Chart')
require("trix")
require("@rails/actiontext")
global.toastr = require("toastr")
import 'select2'
import 'select2/dist/css/select2.css'
$( document ).on('turbolinks:load', function() {
  $('.multi-select').select2()
  $('trix-editor').css("min-height", "350px");
  $('trix-editor').css("overflow-y", "auto");

})