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
  // Bootstrap -------------------------------------------------
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })
// --------------------------------------------------------------

    const date = new Date();
    var dd = String(date.getDate()).padStart(2, '0');

    const itensCallModal = document.querySelectorAll(".callModal");
    itensCallModal.forEach( (item)=>{
        item.addEventListener("click", (event)=>{ 
           var hour = item.getAttribute("data-time");
           var ddAttr = item.getAttribute("data-date");
           var reciveDD = document.getElementById("reservation-date");
           var reciveHour = document.getElementById("reservation-time");
           var reciveInputDD = document.getElementById("date-input");
           var reciveInputHour = document.getElementById("time-input");
           var title = document.querySelector(".reservation-title");

           reciveDD.innerText = dd;
           reciveHour.innerText = hour;
           reciveInputDD.value = ddAttr;
           reciveInputHour.value = hour;
           
           switch (true) {
            case (ddAttr == -2):
                title.innerText = "Book on Monday";
              break;
            case (ddAttr == -1):
                title.innerText = "Book on Tuesday";
              break;
            case (ddAttr == 0):
                title.innerText = "Book on Wednesday";
              break;
            case (ddAttr == 1):
                title.innerText = "Book on Thursday";
              break;
            case (ddAttr == 2):
                title.innerText = "Book on Friday";
              break;
          }
        
        });
    } );
    const itensCallModalEdit = document.querySelectorAll(".callModalEdit");
    itensCallModalEdit.forEach( (item)=>{
        item.addEventListener("click", (event)=>{ 

            var ddAttr = item.getAttribute("data-date");
            var title = document.querySelector(".reservation-title");
            var ddForm = document.getElementById("data-form");
            
            ddForm.innerText = dd;

           switch (true) {
            case (ddAttr == -2):
                title.innerText = "Monday";
              break;
            case (ddAttr == -1):
                title.innerText = "Tuesday";
              break;
            case (ddAttr == 0):
                title.innerText = "Wednesday";
              break;
            case (ddAttr == 1):
                title.innerText = "Thursday";
              break;
            case (ddAttr == 2):
                title.innerText = "Friday";
              break;
          }
        });
    } );
  


  });