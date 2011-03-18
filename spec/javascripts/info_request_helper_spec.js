describe("form_watcher", function() {

  beforeEach(function() {
      $("#container").detach();
      $('body',document).append("<div id='container'>" +
        "<form id='form_to_watch'>"+
            "<input type='submit' name='submit' value='Submit'>" +
            '<input name="trucs[mush]" type="checkbox" value="1" >' +
            "<input type='text' name='some_text' value=''/> "+
        "</form>"+
      "</div>");

      $(document).ready(function(){
        add_form_watcher("form_to_watch");
      });
  });

  it("selecting an unselected click-reactive input should enable an disabled submit button", function() {
     $('input[type="submit"]').attr("disabled", "disabled");
     $("input[name='some_text']").removeClass("empty");
     $("input[name='trucs[mush]']").click();

     expect($('input[type="submit"]').attr("disabled")).toEqual(false);
  });

  it("unselecting the last selected option should disable the submit button", function() {
     $('input[type="submit"]').removeAttr("disabled");
     $("input[name='trucs[mush]']").addClass("option_selected");
     $("input[name='trucs[mush]']").attr("checked","checked");
     $("input[name='some_text']").addClass("empty");

     $("input[name='trucs[mush]']").click();

     expect($('input[type="submit"]').attr("disabled")).toEqual(true);
  });

  it("Filling an empty text field should enable the submit button", function() {
     $('input[type="submit"]').attr("disabled", "disabled");
     $("input[name='some_text']").attr("value","");
     $("input[name='trucs[mush]']").addClass("option_selected");

     $("input[name='some_text']").attr('value','something');
     $("input[name='some_text']").keyup()

     expect($('input[type="submit"]').attr("disabled")).toEqual(false);
  });

  it("Emptying a text field should disable the submit button", function() {
     $('input[type="submit"]').removeAttr("disabled");

     $("input[name='some_text']").attr('value','');
     $("input[name='some_text']").keyup()

     expect($('input[type="submit"]').attr("disabled")).toEqual(true);
  });
});