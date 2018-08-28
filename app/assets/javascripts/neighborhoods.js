$(document).ready(function() {
  attachNeighborhoodListeners();
    console.log('im running hood');
});

function attachNeighborhoodListeners(){
  $(".hoods").on('click', (e) => toggleHoods(e))

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
