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

function displayNewMuralForm(e) {
    e.preventDefault()
    displayBlock($("#newMuralForm"))
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

function createMural(e){
  event.preventDefault();
  var values = $(this).serialize()
  var posting = $.post('/murals', values)
  posting.done(function (data){
    debugger
  })
}
