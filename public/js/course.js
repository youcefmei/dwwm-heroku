let courseBlock = document.getElementById("courses")
let searchCourse = document.getElementById("search-courses")
let previousUrl = window.location.href
searchCourse.addEventListener("input", (e) => {
  let url = new URL(previousUrl)
  const urlSearchParams = new URLSearchParams(window.location.search)
  urlSearchParams.set("s", searchCourse.value)
  url.search = urlSearchParams.toString()
  fetch(url)
    .then((response) => {
      if (response.status !== 200) {
        console.log(
          "Looks like there was a problem. Status Code: " + response.status
        )
        return
      }
      return response.text()
    })
    .then((res) => {
      while (courseBlock.firstChild) {
        courseBlock.removeChild(courseBlock.firstChild)
      }
      let template = document.createElement("template")
      html = res.trim()
      template.innerHTML = html
      courseBlock.appendChild(template.content.firstChild)
    })
})

let selectInProgessCompleted = document.getElementById(
  "select-inprogress-completed"
)

if (selectInProgessCompleted) {
  selectInProgessCompleted.addEventListener("change", (e) => {
    let cardCourses = document.getElementsByClassName("card-course")
    for (const card of cardCourses) {
      // card.classList.toggle("d-none")
      if (e.target.value == "inprogress") {
        if (card.querySelector(".inprogress-course")) {
          card.classList.remove("d-none")
        } else {
          card.classList.add("d-none")
        }
      } else if (e.target.value == "completed") {
        if (card.querySelector(".completed-course")) {
          card.classList.remove("d-none")
        } else {
          card.classList.add("d-none")
        }
      } else {
        card.classList.remove("d-none")
      }
    }
  })
}
