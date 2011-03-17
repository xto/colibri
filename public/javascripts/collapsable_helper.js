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

  function make_collapsable_option_group(option_name){
    $('#'+option_name+'_header').toggle(
      function(){
          collapse('#'+option_name);
      },
      function(){
          expand('#'+option_name);
      }
    );

    $('.'+option_name+'_option').click(
      function(){
          if($(this).hasClass("option_selected")){
              $(this).removeClass("option_selected")
              if ($('.'+option_name+'_option.option_selected').length == 0) {
                  $("#all_"+option_name).attr("checked", "checked");
              }
          }else{
              $(this).addClass("option_selected")
              $("#all_"+option_name).attr("checked", "");
          }
      }
    );

    $('#all_'+option_name).click(
      function() {
        $('.'+option_name+'_option').attr("checked","");
        $('.'+option_name+'_option').removeClass("option_selected")
      }
    );
  }