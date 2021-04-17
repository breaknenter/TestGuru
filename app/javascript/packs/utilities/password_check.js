document.addEventListener("turbolinks:load", () => {
  const pass = document.querySelector("#user_password_confirmation")

  if (pass) { pass.addEventListener("input", checkPass) }
})

function checkPass() {
  const pass = document.getElementById("user_password")
  const pass_confirm = document.getElementById("user_password_confirmation")

  if (pass_confirm.value === "") {
    document.querySelector(".octicon-x-circle-fill").classList.add("hide")
    document.querySelector(".octicon-check-circle-fill").classList.add("hide")

    return
  }

  if (pass.value === pass_confirm.value) {
    document.querySelector(".octicon-x-circle-fill").classList.add("hide")
    document.querySelector(".octicon-check-circle-fill").classList.remove("hide")
  } else {
    document.querySelector(".octicon-check-circle-fill").classList.add("hide")
    document.querySelector(".octicon-x-circle-fill").classList.remove("hide")
  }
}
