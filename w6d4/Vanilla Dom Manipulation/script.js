document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });




  const favoriteSubmit = (el) => {
    el.preventDefault();

    let favorInput = document.querySelector(".favorite-input");
    let favoritePlace = favorInput.value;
    favorInput.value = "";

    let newListLi = document.createElement("li");
    newListLi.textContent = favoritePlace;

    let favorList = document.getElementById("sf-places");
    favorList.appendChild(newListLi);

  };

  const submitButton = document.querySelector(".favorite-submit");
  submitButton.addEventListener("click", favoriteSubmit);




  // adding SF places as list items

  // --- your code here!



  // adding new photos

  // --- your code here!



});
