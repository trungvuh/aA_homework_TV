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





  const showPhotoForm = (e) => {
   const photoFormDiv = document.querySelector(".photo-form-container");
   if (photoFormDiv.className === "photo-form-container") {
     photoFormDiv.className = "photo-form-container hidden";
    } else {
     photoFormDiv.className = "photo-form-container";
    }
  };

   const photoFormShowButton = document.querySelector(".photo-show-button");
   photoFormShowButton.addEventListener("click", showPhotoForm);


   const handlePhotoSubmit = (e) => {
     e.preventDefault();

     const photoUrlInput = document.querySelector(".photo-url-input");
     const photoUrl = photoUrlInput.value;
     photoUrlInput.value = "";

     const newImg = document.createElement("img");
     newImg.src = photoUrl;

     const newPhotoLi = document.createElement("li");
     newPhotoLi.appendChild(newImg);

     const dogPhotosList = document.querySelector(".dog-photos");
     dogPhotosList.appendChild(newPhotoLi);
    };

   const photoSubmitButton = document.querySelector(".photo-url-submit");
   photoSubmitButton.addEventListener("click", handlePhotoSubmit);


  // adding SF places as list items

  // --- your code here!



  // adding new photos

  // --- your code here!



});
