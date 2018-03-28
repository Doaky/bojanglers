
$(document).ready(function() {
	var username;
	// If there is a username in localStorage use it, if not set to hardcoded user.
	if (localStorage.username) {
		username = localStorage.username;
	}
	else {
		username = "Daniel";
	}

	addUsername();

	// Starts session with editing off.
	$(".editing").hide();

	// Toggles edit view
	$("#edit").click(function() {
		$(".editing").show();
		$("#edit").hide();
	});

	$("#done").click(function() {
		$(".editing").hide();
		$("#done").hide();
		$("#edit").show();
	});

	// Modals
	// Get the modal
	var timelineAddModal = document.getElementById('timelineAdd');
	var timelineEditModal = document.getElementById('timelineEdit');
	var pandaEditModal = document.getElementById('pandaEdit');
	var documentAddModal = document.getElementById('documentAdd');
	var documentEditModal = document.getElementById('documentEdit');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	var timelineID = document.getElementById("timelineID");
	var documentID = document.getElementById("documentID");

	$(".timelineEntry").click(function() {
		timelineEditModal.style.display = "block";
		timelineID.value = this.id;
	});

	$(".documentEntry").click(function() {
		documentEditModal.style.display = "block";
		documentID.value = this.id;
	});

	$("#addEvent").click(function() {
		timelineAddModal.style.display = "block";
	});

	$("#general").click(function() {
		pandaEditModal.style.display = "block";
	});

	$("#addDocument").click(function() {
		documentAddModal.style.display = "block";
	});

	// When the user clicks on <span> (x), close the modal
	// span.onclick = function() {
	$(".close").click(function() {
	    timelineEditModal.style.display = "none";
	    timelineAddModal.style.display = "none";
	    pandaEditModal.style.display = "none";
	    documentAddModal.style.display = "none";
	    documentEditModal.style.display = "none";
	});

	// Replaced defualt "user" text with actual username.
	function addUsername() {
		$(".username").text(username);
	}

	// Avatar Uploading
	var upload = function(image) {
		var avatar = new FileReader();
		avatar.onload = function (e) { 
			// Adds the picture's path to the HTML object's src attribute.
			$(".profile-picture").attr('src', e.target.result);
		}
		// Actually loads in image from input
		avatar.readAsDataURL(image.files[0]);
	};

	// Runs when the input field changes (gets input)
	$(".file-upload").on('change', function() {
		upload(this);
	});

	// Keeps track of event number
	var eventCounter = 1;
	// Adds event entry when clicked
	$("#add-event").click(function () {
		$(".event-container").append('Event ' + eventCounter + ': <input type="date" name="event-date-1">'
			+ '<br><textarea rows="4" cols="50" name="event-description-1" form="usrform"'
			+ 'placeholder="Enter Event Description..."></textarea><br>');
		eventCounter++;
	});
});