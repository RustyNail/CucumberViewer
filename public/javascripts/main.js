function checkFeature() {
  if($('#hidefeature').is(':checked')) {
    $('.feature').hide();
    $('br.scenario:nth-child(1)').hide();
  } else {
    $('.feature').show();
  }
}

function checkScenario() {
  if($('#hidescenario').is(':checked')) {
    $('.scenario').hide();
  } else {
    $('.scenario').show();
  }
}
