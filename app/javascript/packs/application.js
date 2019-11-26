import "bootstrap";
import $ from 'jquery';
import iniDatePicker from 'datetimepicker';
import Weather from 'weatherapp'

iniDatePicker();
Weather();



  // document.querySelector('.planner-wrapper').addEventListener('wheel', (event) => {
  //   console.log(event.currentTarget.getBoundingClientRect())
  //   console.log(event.currentTarget.offsetLeft)
  // })


  if (document.getElementById('td-0')) {
    document.getElementById('td-0').addEventListener('click',function(){
      document.querySelector('bg-modal').style.display ='flex'
    })
  }



  document.addEventListener("DOMContentLoaded", (event) => {
    const previousSpace = document.querySelector(".nav-link.active").parentElement.previousElementSibling
    const nextSpace = document.querySelector(".nav-link.active").parentElement.nextElementSibling

    previousSpace.classList.add("top-border")
    nextSpace.classList.add("bottom-border")

  })


  document.querySelectorAll(".nav-link").forEach((item) => {
    item.addEventListener("mouseenter", (event) => {
      const previousSpace = event.currentTarget.parentElement.previousElementSibling
      const nextSpace = event.currentTarget.parentElement.nextElementSibling

      previousSpace.classList.add("top-border")
      nextSpace.classList.add("bottom-border")
    })

    item.addEventListener("mouseleave", (event) => {
      const previousSpace = event.currentTarget.parentElement.previousElementSibling
      const nextSpace = event.currentTarget.parentElement.nextElementSibling
      if (!event.currentTarget.classList.contains('active')) {
        previousSpace.classList.remove("top-border")
        nextSpace.classList.remove("bottom-border")
      }
    })
  })

  document.querySelectorAll('.smooth-date').forEach((item) => {
    item.addEventListener('click', (event) => {
      event.preventDefault();
      document.querySelector(event.currentTarget.dataset.target).scrollIntoView({behavior: 'smooth', position: 'start'})
    })
  })
