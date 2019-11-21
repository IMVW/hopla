
// Get the container element
const elementContainer = document.getElementById("links");

// Get all buttons with class="btn" inside the container
const links = elementContainer.getElementsByClassName("nav-element");

// Loop through the buttons and add the active class to the current/clicked button
for (const i = 0; i < links.length; i++) {
  links[i].addEventListener("click", function() {
    const current = document.getElementsByClassName("active");

    // If there's no active class
    if (current.length > 0) {
      current[0].className = current[0].className.replace(" active", "");
    }

    // Add the active class to the current/clicked button
    this.className += " active";
  });
}

export { current };



// const navElements = document.querySelectorAll('.nav-element')

// const toggleActive = (event) => {
//   event.currentTarget.classList.toggle("clicked")
// };

// navElements.forEach((element) => {
//   element.addEventListener('click', toggleActive);
//   console.log(currentTarget)
// });

// export { toggleActive };
