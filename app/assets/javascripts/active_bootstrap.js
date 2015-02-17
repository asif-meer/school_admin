$(function(){
	// $('.batch_students').hide()
	$('.batch_subjects').hide()
	$('.nav-pills li:first-child a').click(function(e) {
		// var $this = $(this);
		// if (!$this.hasClass('active')) {
		// 	alert("hello");
		// }
		$('.batch_students').show()
		$('.batch_subjects').hide()
		$('.nav-pills li:first-child a').css("background-color", "#25458B")
		$('.nav-pills li:last-child a').css("background-color", "transparent")
		e.preventDefault();
	});
	$('.nav-pills li:last-child a').click(function(e) {
		$('.batch_subjects').show()
		$('.batch_students').hide()
		$('.nav-pills li:first-child a').css("background-color", "transparent")
		$('.nav-pills li:last-child a').css("background-color", "#25458B")
		e.preventDefault();
	});
	$('.nav-pills li:first-child a').css("background-color", "#25458B")


	$('#class_details_tab_2').hide()
	$('#class_details_tab_3').hide()
	$('.nav-tabs li:nth-child(1)').click(function(e) {
		$('#class_details_tab_1').show()
		$('#class_details_tab_2').hide()
		$('#class_details_tab_3').hide()
		$('.nav-tabs li:nth-child(1)').addClass( "active" );
		$('.nav-tabs li:nth-child(2)').removeClass( "active" );
		$('.nav-tabs li:nth-child(3)').removeClass( "active" );
		e.preventDefault();
	});
	$('.nav-tabs li:nth-child(2)').click(function(e) {
		$('#class_details_tab_1').hide()
		$('#class_details_tab_2').show()
		$('#class_details_tab_3').hide()
		$('.nav-tabs li:nth-child(1)').removeClass( "active" );
		$('.nav-tabs li:nth-child(2)').addClass( "active" );
		$('.nav-tabs li:nth-child(3)').removeClass( "active" );
		e.preventDefault();
	});
	$('.nav-tabs li:nth-child(3)').click(function(e) {
		$('#class_details_tab_1').hide()
		$('#class_details_tab_2').hide()
		$('#class_details_tab_3').show()
		$('.nav-tabs li:nth-child(1)').removeClass( "active" );
		$('.nav-tabs li:nth-child(2)').removeClass( "active" );
		$('.nav-tabs li:nth-child(3)').addClass( "active" );
		e.preventDefault();
	});
	$('.nav-tabs li:nth-child(1)').addClass( "active" );


	// $("#subjects_students").hide()
	// $('.nav_subjects li:last-child a').click(function(e) {
	// 	$("#subjects_subjects").show()
	// 	$("#subjects_students").hide()
	// 	$('.nav_subjects li:first-child a').css("background-color", "transparent")
	// 	$('.nav_subjects li:last-child a').css("background-color", "#0ce3ac")
	// 	e.preventDefault();
	// });

	// $('.nav_subjects li:last-child a').click(function(e) {
	// 	$("#subjects_subjects").hide()
	// 	$("#subjects_students").show()
	// 	$('.nav_subjects li:first-child a').css("background-color", "transparent")
	// 	$('.nav_subjects li:last-child a').css("background-color", "#0ce3ac")
	// 	e.preventDefault();
	// });
	// $('.nav_subjects li:first-child a').css("background-color", "#0ce3ac")

});

$(function(){
	$(".student_dropdown").hover(            
        function() {
            $('.student_profile_hover', this).stop( true, true ).fadeIn("fast");
            $(this).toggleClass('open');
            // $('b', this).toggleClass("caret caret-up");                
        },
        function() {
            $('.student_profile_hover', this).stop( true, true ).fadeOut("fast");
            $(this).toggleClass('open');
            // $('b', this).toggleClass("caret caret-up");                
        });

	$(".period_dropup").hover(            
        function() {
            $('.period_hover', this).stop( true, true ).fadeIn("fast");
            $(this).toggleClass('open');
            // $('b', this).toggleClass("caret caret-up");                
        },
        function() {
            $('.period_hover', this).stop( true, true ).fadeOut("fast");
            $(this).toggleClass('open');
            // $('b', this).toggleClass("caret caret-up");                
        });
});
