// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap'
import '../stylesheets/application'
import { Tooltip, Popover } from "bootstrap"
import { data } from "jquery"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require('jquery')
require("@popperjs/core")

document.addEventListener('turbolinks:load', () => {

    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })

    const itensCallModal = document.querySelectorAll(".callModal");
    itensCallModal.forEach( (item)=>{
        item.addEventListener("click", (event)=>{ 
           const date = new Date();
           var dd = String(date.getDate()).padStart(2, '0');
           var hour = item.getAttribute("data-time");
           var ddAttr = item.getAttribute("data-date");
           const reciveDD = document.querySelector("#reservation-date");
           const reciveHour = document.querySelector("#reservation-time");
           const reciveInputDD = document.querySelector("#date-input");
           const reciveInputHour = document.querySelector("#time-input");
           const title = document.querySelector(".reservation-title");

           reciveDD.innerText = dd;
           reciveHour.innerText = hour;
           reciveInputDD.value = ddAttr;
           reciveInputHour.value = hour;

           switch (true) {
            case (ddAttr == -2):
                title.innerText = "book on monday";
              break;
            case (ddAttr == -1):
                title.innerText = "book on tuesday";
              break;
            case (ddAttr == 0):
                title.innerText = "book on wednesday";
              break;
            case (ddAttr == 1):
                title.innerText = "book on thursday";
              break;
            case (ddAttr == 2):
                title.innerText = "book on friday";
              break;
          }
        
        });
    } );
    
  });