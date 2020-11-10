$(function () {
    var $activeSlide =  $('#slides .slide:first-child');

    $(".match-title").click("click", function(){
        var account_id = $(this).data("id");
        console.log(account_id);
    })

    $("#decline").on("click", function() {
        console.log("decline");
        goToSlide('decline');

    });

    $("#approve").on("click", function() {
        var user_id =  $activeSlide.data("id");
        $.ajax({
            url: "/approve/" + user_id,
            method: "post",
            dataType: "ajax" 
        });
        goToSlide('approve');

    });


    function goToSlide(action) {
        $activeSlide.removeClass("showing");
        $activeSlide = $activeSlide.next(".slide");
        if(action == "approve"){
        }
        else{

        }
        $activeSlide.addClass("showing");

        // slides[currentSlide].className = 'slide';
        // currentSlide = (n+slides.length)%slides.length;
        // slides[currentSlide].className = 'slide showing';
    }
});

