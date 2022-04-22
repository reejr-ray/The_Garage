function addCustomHTML(response, cssSelector, elementType) {
    //creating an html div element that will hold our content
    element = document.createElement(elementType);
    console.log("addCustomHTML log: " + Object.values(response));

    for( i = 0; i < response.length ; i++){
        addParkingSpotCards(cssSelector, response[i]);
        console.log("i is: " + i);
    }

    element.innerHTML = JSON.stringify(response);
    //append, add the new div to the div with the matching css selector
    //here we are using id='cards-container'
        //$(cssSelector).append(element);
    //response.forEach(addParkingSpotCards(cssSelector));

}

function addParkingSpotCards(cssSelector, response){
    console.log("addParkingSPotCards log: " + JSON.stringify(response[0]));
    let dynamicCard = htmlCard.replace('%title', response['Street'])
        .replace('%img_name', response['img_name'])
        .replace('%Rate', response['rentalRate']).replace("%description", response['parkingType']);
        $(cssSelector).append(dynamicCard);
}


let htmlCard = '<div class=\"w3-third w3-margin-bottom\">'
htmlCard += '<img src="../resources/%img_name" alt="picture of driveway" style="width:510px; height:246px;">';
htmlCard += '<div class="w3-container w3-white">';
htmlCard += '<h3>%title</h3>';
htmlCard += '<h6 class="w3-opacity">Starting at $%Rate an hour</h6>';
htmlCard += '<p>%description</p>';
htmlCard += '<a href="moreSpecific.html"><button class="w3-button w3-block w3-black w3-margin-bottom">More Info</button></a>';
htmlCard += '<button class="w3-button w3-block w3-red w3-margin-bottom">Book Spot</button>';
htmlCard += '</div>'
htmlCard += '</div>'



function accountSignInSubmit(username, password) {
                alert("The paragraph was clicked.");
}
