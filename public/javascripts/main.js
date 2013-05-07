var speed = 'normal';
function switchView(target) {
  switch(target) {
    case 'feature':    
      if($('#hidefeature').is(':checked')) {
        $('.feature').hide(speed);
        $('br.scenario:nth-child(1)').hide();
      } else {
        $('.feature').show(speed);
      }
      break;
    case 'scenario':
      if($('#hidescenario').is(':checked')) {
        $('.scenario').hide(speed);
      } else {
        $('.scenario').show(speed);
      }
      break;
    default:
      if($(target +  ' legend input').attr('src') == '/images/plus.gif') {
        $(target +  ' .wrap').show(speed);
        $(target +  ' legend input').attr('src', '/images/minus.gif');
      } else {
        $(target +  ' .wrap').hide(speed);
        $(target +  ' legend input').attr('src', '/images/plus.gif');
      }
      break;
  }
}
