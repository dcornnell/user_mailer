var required = ["user_name", "user_email" , "user_password", "user_password_confirmation"];

emptyerror = "please fill out this field";

$("#new_user").submit(function(){
	for (i=0;i<required.length;i++) {
		var input = $('#'+required[i]);
		var isValid = true;

if ((input.val() == "") || (input.val() == emptyerror)) {

	input.addClass("needsFilled");
	input.val(emptyerror);

	isValid = false;

} else {
input.removeClass(" needsFilled ");
	isValid = true;
}
}
return isValid;
});


$(".div4").click(function(){
   $(".div1").fadeIn(2000);
   $(".div2").fadeIn(3000);
   $(".div3").fadeIn(4000);
  });

 $(".div2").click(function(){
    $("#panel").slideDown("slow");
  });

 $(".loginClicker").click(function(){
    $("#login").slideDown("slow");
  });

  $(".xOut").click(function(){
    $("#login").slideUp("fast");
  });



$('.panel').on('click', function(){
  var user_id = $(this).attr('data-user-id');
  var panel = $(this);


  $.ajax({
    url: "/users/" + user_id,
    type: "DELETE",
    data:{

    },
    success: function(data){
      console.log(data);  
        if (data == "1") {
          console.log("true");
          $(panel).hide("slow");
        }
        else {
          console.log("false");
          alert("Im invincible!")
          $(panel).addClass("callout")
          

          
        }
      }

  })

});



