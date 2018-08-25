$(document).ready(function() {
  attachListeners();
});

function attachListeners(){
  $("#newMural").on('click', (e) => displayNewMuralForm(e))
  $("a.nextMural").on('click', (e) => nextMural(e))
  $("form#new_mural").on('submit', (e) => createMural(e))
  $(".nextArtist").on('click', (e) => getNextArtist(e))
}

function displayBlock(element){
  $(element).css({
    'display': 'block'
  })
}

function getNextArtist(e){
  e.preventDefault()
  let path = e['target']['dataset']['id']
  let nextArtist = $.getJSON(path)
  nextArtist.done(function(artist){
    displayArtist(artist)
  })
}

function displayArtist(allData){
  let artist = allData.all_data.artist
  let nextArtist = allData.all_data.nextArtist
  $(".artist-title").text(artist.artist_name)
  $(".real-name").text(artist.name)
  $('.bio').text(artist.bio)
  $("#instagram").attr("href", `http://www.instagram.com/${artist.instagram}`)
  $(".nextArtist").attr("data-id",nextArtist.id; "href", `/artists/${artist.id}`)
  displayArtistMurals(artist.murals)
}

function displayArtistMurals(muralArray) {
  $("#artistMurals").empty()
  muralArray.forEach(function(mural){
    $("#artistMurals").append(`<li><a href="murals/${mural.id}">${mural.location_details}</a> located in <a href="neighborhoods${mural.neighborhood.id}">${mural.neighborhood.name}</a></li>`)
  })
}


function nextMural(e){
  e.preventDefault()
  let path = e['target']['pathname']
  let nextMural = $.getJSON(path)
  nextMural.done(function(mural) {
  $("#muralLocation").text(mural.location_details)
  $("#muralHood").html(`<a data-id="${mural.neighborhood.id}" href="${mural.neighborhood.name}"> ${mural.neighborhood.name}</a>`)
  })

}

function displayNewMuralForm(e) {
    e.preventDefault()
    displayBlock($("#newMuralForm"))
}

function createMural(e){
  event.preventDefault();
  var values = $("#new_mural").serialize()
  var newMural = $.post('/murals', values)
  newMural.done(function (muralData){
    newMuralLi(muralData)
  })
}

function newMuralLi(info) {
  $("#artistMurals").append(
    `<li><a id=${info.id} href=/artists/${info.artist.id}/murals/${info.id}> ${info.location_details}</a> located in <a href=/neighborhoods/${info.neighborhood.id}> ${info.neighborhood.name}</a></li>`
  )
}

// function Mural(mural){
//   this.id = mural.id
//   this.location_details = mural.location_details
//   this.neighborhood_id = mural.neighborhood_id
//   this.active = mural.active
// }
