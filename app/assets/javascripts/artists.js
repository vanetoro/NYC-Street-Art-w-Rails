$(document).ready(function() {
  attachArtistListeners();
    console.log('im running artist');

});

function attachArtistListeners(){
  $(".quickView").on('click', (e) => muralsQuickView(e))
  $(".showNextPrevious").on('click', (e) => getNextArtist(e))
  $("#newMural").on('click', (e) => toggleNewMuralForm(e))
  $("form#new_mural").on('submit', () => createMural())
  // $('#getTotal').on('click', (e) => getTotalMurals(e))
}

// function getTotalMurals() {
//   var total;
//   let artistArray = $.getJSON('/artists')
//   artistArray.done(function(artists) {
//     total = artists.reduce(function(murals, artist){ return murals + artist.murals.length},0)
//     $('#getTotal').append(total)
//   })
// }

function getNextArtist(e){
  e.preventDefault()
  let path = e['target']['dataset']['id']
  let nextArtist = $.getJSON(path)
  nextArtist.done(function(artist){
    displayArtist(artist)
    window.history.pushState('', '', path);
  })
}

function displayArtist(artist){
  setNextArtist(artist)
  setPreviousArtist(artist)
  $(".artist-title").text(artist.artist_name)
  $(".real-name").text(artist.name)
  $('.bio').text(artist.bio)
  $("#instagram").attr("href", `http://www.instagram.com/${artist.instagram}`)
  $("#artistIdForm").attr('value', artist.id)
  displayArtistMurals(artist.murals)
}

function setNextArtist(artist){
  let nextArtistinfo = $.getJSON(`/artists/${artist.id}/next_artist`)
  nextArtistinfo.done(function(nextArtistJSON){
    $("#nextArtist").attr("data-id",nextArtistJSON.id)
  })
}

function setPreviousArtist(artist) {
  let previousArtistinfo = $.getJSON(`/artists/${artist.id}/previous_artist`)
  previousArtistinfo.done(function(previousArtistJSON){
    $("#previousArtist").attr("data-id",previousArtistJSON.id)
  })
}

function displayArtistMurals(muralArray) {
  $("#artistMurals").empty()
  muralArray.forEach(function(mural){
    $("#artistMurals").append(`<li><a href="murals/${mural.id}">${mural.location_details}</a> located in <a href="neighborhoods${mural.neighborhood.id}">${mural.neighborhood.name}</a></li>`)
  })
}



function muralsQuickView(e) {
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
  return `<li><a id=${this.id} href=/artists/${this.artist_id}/murals/${this.id}> ${this.location_details}</a> located in <a href=/neighborhoods/${this.neighborhood_id}> ${this.neighborhood}</a></li>`
}


// function getProfilePic() {
//   let path = $("#instagram")['0']['href']
//   $.get(path, function(html){
//     let instaJson = html.to_json
//     debugger
//   })
//
// }
