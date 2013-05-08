var speed = 'normal';
function switchView(target) {
  switch(target) {
    case 'feature':    
      var br = $('.wrap > .scenario > br:first-child');
      if($('#hidefeature').is(':checked')) {
        $('.feature').hide(speed);
        br.hide();
      } else {
        $('.feature').show(speed);
        br.show();
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
      var input = $(target +  ' legend input');
      var wrap = $(target +  ' .wrap');
      if(input.attr('src') == '/images/plus.gif') {
        wrap.show(speed);
        input.attr('src', '/images/minus.gif');
      } else {
        wrap.hide(speed);
        input.attr('src', '/images/plus.gif');
      }
      break;
  }
}
