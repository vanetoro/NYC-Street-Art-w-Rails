$(document).ready(function() {
  attachListeners();
});

function attachListeners(){
  $(".hoods").on('click', (e) => toggleHoods(e))
  $(".quickView").on('click', (e) => muralsQuickView(e))
  $("a.nextMural").on('click', (e) => nextMural(e))
  $("#nextArtist").on('click', (e) => getNextArtist(e))
  $("#newMural").on('click', (e) => toggleNewMuralForm(e))
  $("form#new_mural").on('submit', () => createMural())
}


function getNextArtist(e){
  e.preventDefault()
  let path = e['target']['dataset']['id']
  let nextArtist = $.getJSON(path)
  // debugger
  nextArtist.done(function(artist){
    displayArtist(artist)
  })
}

function displayArtist(artist){
  let nextArtist = artist.id + 1
  $(".artist-title").text(artist.artist_name)
  $(".real-name").text(artist.name)
  $('.bio').text(artist.bio)
  $("#instagram").attr("href", `http://www.instagram.com/${artist.instagram}`)
  $("#nextArtist").attr("data-id",nextArtist)
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

function toggleHoods(e) {
  e.preventDefault()
  let id = parseInt(e.target.dataset.id)
  togglePlusSign(id)
  $(`#hoodMurals-${id}`).toggleClass("d-none")
}


function togglePlusSign(id){
  if($(`#hood-${id}`).text().includes('+')){
    $(`#hood-${id}`).text('-')
  } else
    $(`#hood-${id}`).text('+')
  }

function muralsQuickView(e) {
  // e.preventDefault()
    var id = e.target.dataset.id
    getMurals = $.getJSON(`/artists/${id}`)
    getMurals.done(function(artist){
      let murals = artist.murals
      let artistId = artist.id
      $(`#artistMurals-${artistId}`).empty()
        murals.forEach(function(mural){
        $(`#artistMurals-${artistId}`).append(`<a class="black"href="/murals/${mural.id}" data-muralId="${mural.id}">${mural.location_details} - ${mural.neighborhood.name}</a><br>`)
      })
})
}

function toggleNewMuralForm(){
    $(`#newMuralForm`).removeClass("d-none")
}

function createMural(e){
  event.preventDefault();
  var values = $("#new_mural").serialize()
  var newMural = $.post('/murals', values)
  $("#mural_location_details").val('')
  $("#mural_neighborhood_id").val('')
  $("#submitBtn").prop('disabled', false)
  newMural.done(function (muralData){
    let createdMural = new Mural(muralData)
    // createdMural.isActive()
    let text = createdMural.createLine()
    $("#artistMurals").append(text)
  })
}


function Mural(mural){
  this.id = mural.id
  this.artist_id = mural.artist.id
  this.location_details = mural.location_details
  this.neighborhood = mural.neighborhood.name
  this.neighborhood_id = mural.neighborhood.name
  this.active = mural.active
  }

  Mural.prototype.isActive = () => {
    debugger
    if(this.active === 1){
      "Yes"
    } else{
      "No"
    }
}

Mural.prototype.createLine = function(){
  // debugger
  return `<li><a id=${this.id} href=/artists/${this.artist_id}/murals/${this.id}> ${this.location_details}</a> located in <a href=/neighborhoods/${this.neighborhood_id}> ${this.neighborhood}</a></li>`
}


// function newMuralLi(mural) {
//   $("#artistMurals").append(
//     `<li><a id=${mural.id} href=/artists/${mural.artist_id}/murals/${mural.id}> ${mural.location_details}</a> located in <a href=/neighborhoods/${mural.neighborhood_id}> ${mural.neighborhood}</a></li>`
//   )
// }
// function getProfilePic() {
//   let path = $("#instagram")['0']['href']
//   $.get(path, function(html){
//     let instaJson = html.to_json
//     debugger
//   })
//
// }
