describe("collapsable_helper", function() {


  var cycle_criteria

  beforeEach(function() {
      $("#container").detach();
      $('body',document).append("<div id='container'>" +
        "<input id='all_trucs' name='all_trucs' type='radio' value='0'>" +
        '<input class="trucs_option" id="trucs_mush" name="trucs[mush]" type="checkbox" value="1" >' +
        '<input class="trucs_option" id="trucs_mush_more" name="trucs[mush_more]" type="checkbox" value="2">' +
      "</div>");

      $(document).ready(function(){
        make_collapsable_option_group("trucs");
      });
  });
  afterEach(function() {

  });

  describe("when all_cycles option is selected", function(){
    beforeEach(function(){
      $('#all_trucs').attr("checked", "checked");
    });

    it("should unselect all_cycles when selecting a specific cycle", function() {
      $('#trucs_mush').click();
      expect($('#all_trucs').attr("checked")).toEqual(false);
    });

  });

  describe("when specific cycles are selected", function(){
    beforeEach(function(){
        $('input').attr("checked","");
        $('input').removeClass("option_selected")
        $(".trucs_option").click();
    });

    it("should uncheck all when all_options button is selected", function() {
        $('#all_trucs').click();
        expect($('#trucs_mush').attr("checked")).toEqual(false);
        expect($('#trucs_mush').hasClass("option_selected")).toEqual(false);
        expect($('#trucs_mush_more').attr("checked")).toEqual(false);
        expect($('#trucs_mush_more').hasClass("option_selected")).toEqual(false);
    });

    it ("should select the all_options button when the last option is uncheck", function() {
        $('#trucs_mush').click();
        expect($('#all_trucs').attr("checked")).toEqual(false);
        $('#trucs_mush_more').click();
        expect($('#all_trucs').attr("checked")).toEqual(true);
    });
  });
});