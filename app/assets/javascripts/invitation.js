$(document).ready(function() {
	$("#invitation_guest_state_id").change(function(event) {
    alert($(this).find("option:selected").data("value"));
  });
});