  function collapse(css_selector){
    $(css_selector).slideUp('slow', function(){
      $(css_selector+'_header > h4').removeClass('expanded');
      $(css_selector+'_header > h4').addClass('collapsed');
    });
  }

  function expand(css_selector){
      $(css_selector).slideDown('slow',function(){
        $(css_selector+'_header > h4').removeClass('collapsed');
        $(css_selector+'_header > h4').addClass('expanded');
      });
  }

  function make_collapsable(css_selector){
    $(css_selector+'_header').toggle(
      function(){
          collapse(css_selector);
      },
      function(){
          expand(css_selector);
      }
    );
  }