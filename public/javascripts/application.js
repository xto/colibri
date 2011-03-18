// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function add_form_watcher(form_to_watch_id){
    $("#"+form_to_watch_id+"  input[type!='submit']").click(function(){
      if($(this).attr('type') != 'text' && $(this).attr('type') != 'textarea'){
        if(!$(this).hasClass('option_selected')){
          $(this).addClass('option_selected');

          if($(this).parent().find('input[type="submit"]').attr('disabled') && $("#"+form_to_watch_id+"  input[type^='text'].empty").length == 0){
            $(this).parent().find('input[type="submit"]').removeAttr('disabled');
          }

        }else{
            $(this).removeClass('option_selected');
            if($('#'+form_to_watch_id+' input.option_selected').length == 0){
              $(this).parent().find('input[type="submit"]').attr('disabled','disabled');
            }
        }
      }
    });

    $("#"+form_to_watch_id+"  input[type^='text']").keyup(function(){
      if($(this).val() != '' && $("#"+form_to_watch_id+"  input[type!='submit'].option_selected").length > 0){
        $(this).removeClass('empty');
        $(this).addClass('not_empty');

        if($(this).parent().find('input[type="submit"]').attr('disabled')){
            $(this).parent().find('input[type="submit"]').removeAttr('disabled');
        }
      }else{
        $(this).removeClass('not_empty');
        $(this).addClass('empty');
        if(!$(this).parent().find('input[type="submit"]').attr('disabled')){
            $(this).parent().find('input[type="submit"]').attr('disabled','disabled');
        }
      }
    });

}
