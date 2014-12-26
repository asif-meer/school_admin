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
		$('.nav-pills li:first-child a').css("background-color", "transparent")
		e.preventDefault();
	});
	$('.nav-pills li:last-child a').click(function(e) {
		$('.batch_subjects').show()
		$('.batch_students').hide()
		$('.nav-pills li:first-child a').css("background-color", "transparent")
		e.preventDefault();
	});
	$('.nav-pills li:first-child a').css("background-color", "#0ce3ac")
});