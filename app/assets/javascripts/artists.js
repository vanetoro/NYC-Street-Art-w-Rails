$(document).ready(function() {
  attachListeners();
});

function attachListeners(){
  $("#newMural").on('click', (e) => displayNewMuralForm(e))
  $("a.nextMural").on('click', (e) => nextMural(e))
  $("form#new_mural").on('submit', (e) => createMural(e))
}

function displayBlock(element){
  $(element).css({
    'display': 'block'
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
