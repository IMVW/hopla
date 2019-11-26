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
  document.getElementById('td-0').addEventListner('click',function(){
    document.querySelector('bg-modal').style.display ='flex'
  })
}

