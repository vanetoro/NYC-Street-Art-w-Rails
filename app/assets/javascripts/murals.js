// $(document).ready(function() {
//   attachListeners()
// });
//
//
// function attachListeners() {
//   $("a.nextMural").on('click', (e) => console.log('newMural');nextMural(e))
// }








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
