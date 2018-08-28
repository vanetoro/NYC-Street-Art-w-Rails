$(document).ready(function() {
  attachMuralListeners()
  console.log('im running');
});



function attachMuralListeners() {
    $("a.getNextMural").on('click', (e) => nextMural(e))
}


function nextMural(e){
  console.log('hello')
  debugger
  e.preventDefault()
  let path = e['target']['pathname']
  let nextMural = $.getJSON(path)
  nextMural.done(function(mural) {
  $("#muralLocation").text(mural.location_details)
  $("#muralHood").html(`<a data-id="${mural.neighborhood.id}" href="${mural.neighborhood.name}"> ${mural.neighborhood.name}</a>`)

  })

}





// function showMuralInfo(e) {
//     e.preventDefault()
//     let path = e['target']['pathname']
//     let showMural = $.get(path)
//     debugger
//     showMural.done(function(muralJSON){
//       $(`#locationDetails-${muralJSON.id}`).text(muralJSON.location_details)
//       $(`#neighborhood-${muralJSON.id}`).text(muralJSON.neighborhood.name)
//     })
// }
