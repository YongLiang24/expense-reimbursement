let nav01 = document.getElementById("nav01");
let nav02 = document.getElementById("nav02");
let nav03 = document.getElementById("nav03");
let nav04 = document.getElementById("nav04");


$("#personal-info").hide();
nav01.addEventListener('click', function(){

    console.log("click check script1")

})

nav02.addEventListener('click', function(){

    console.log("click check script2")

})

nav03.addEventListener('click', function(){

    console.log("click check script3")

})

nav04.addEventListener('click', function(){

    console.log("click check script4")
    $("#personal-info").show();

})