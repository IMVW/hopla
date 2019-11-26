const API_KEY = 'e4fd94634ae2ad4aa1c76d8e4d0cd626'
const Weather = () => {
  fetch(`http://api.openweathermap.org/data/2.5/weather?q=Amsterdam&units=metric&appid=${API_KEY}`)

  .then(response => response.json())
  .then((data) => {
    const Data = data;
    const city = data.name;
    const temp =  `${Math.round(data.main.temp)}°`;
    const desc = data.weather[0].description;

    console.log(city);
    console.log(temp);
    console.log(desc);

    // const today = new Date();
    // const options = {day: 'numeric', month: 'long'};
    // const formattedDate = today.toLocaleDateString("en-US", options);
    // console.log(formattedDate);

    const months = ["JAN", "FEB", "MAR","APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
    let current_datetime = new Date()
    let formatted_date = current_datetime.getDate() + " " + months[current_datetime.getMonth()] + "         " + current_datetime.getFullYear()
    console.log(formatted_date)

    document.querySelector('#city').innerHTML = city
    document.querySelector('#temp').innerHTML = temp
    document.querySelector('#condition').innerHTML = desc
    document.querySelector('#date').innerHTML = formatted_date

  })
}
export default Weather




 //temperature.innerText = `${Math.round(data.main.temp) - 273}°C`;
