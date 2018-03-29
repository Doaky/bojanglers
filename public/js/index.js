
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

	searchEventListener();

	loadChaplainDocs();

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

//______________________________________________________________________________//
//--------------------------API SEARCHING FUNCTIONS----------------------------//
function loadChaplainDocs() {
	var displayObjects = [];
	var i = 0;
	while(i < 20) {
		ajaxCall($("#chaplain-name").text(), i+1, displayObjects);
		i++;
	}
}
//event listener for the search button
function searchEventListener() {
  $("#searchbtn").click(function() {
    if ($("#searchbox").val() != '') {
      searchNewspapers($("#searchbox").val());
    }
  });
}
//Makes a function call to load search results
function searchNewspapers(query) {
  $("#search-documents").empty();
  $("#search-documents").append("<p>Loading results for " + query + "</p>");
  var displayObjects = []; //array where results are kept
  var i = 0;
  //load results from the first 20 pages
  while (i < 20) {
    ajaxCall(query, i + 1, displayObjects);
    i++;
  }
}

//displays the results from the search query
function displayResults(objectarray) {
  $("#search-documents").empty();
	$("#chaplain-docs").empty();
  if (objectarray.length == 0) {
    $("#search-documents").append("<p>No results found</p>");
		$("#chaplain-docs").append("<p>No Documents found</p>");
  }
  objectarray.forEach(function(e) {
    $("#search-documents").append('<article class="search-result"> ' +
      '<h3><a href="' + e.link + '">' + e.title + '</a></h3>' +
      '<h5>' + e.location + '</h5>' +
      '<h5>' + e.date + '</h5>' +
      '<hr>' +
      '</article>')

		$("#chaplain-docs").append('<a href="' + e.link + '">' + e.title + '</a>');
  })
}
//this function makes an ajax call to the chroniclingamerica.loc.gov api
function ajaxCall(query, number, displayObjects) {
  //make an ajax call to the chroniclingamerica api and load results into an array
  $.ajax({
    url: 'http://chroniclingamerica.loc.gov/search/pages/results/',
    dataType: 'jsonp',
    data: {
      andtext: 'chaplains ' + query,
      page: number,
      format: 'json'
    },
    success: function(response) {
      response.items.forEach(function(e) {
        //only look for results that are from 1930 or later
        if (parseInt(e.date) > 19300000) {
          var obj = {
            title: toTitleCase(e.title_normal), //title of the newspaper, journal, etc.
            link: 'https://chroniclingamerica.loc.gov' + e.id, //link to the actual article
            location: e.place_of_publication, //location of publication
            text: e.ocr_eng, //full text of the article
            date: e.date.substring(0, 4) + '/' + e.date.substring(4, 6) + '/' + e.date.substring(6, 8) //date of publishing
          };
          displayObjects.push(obj); //add to the array
        }
      });
      displayResults(displayObjects); //display the results when we get them
    }
  });
}

// Source
// https://stackoverflow.com/a/4878800
function toTitleCase(str) {
  return str.replace(/\w\S*/g, function(txt) {
    return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
  });
}

//----------------------END OF API SEARCHING FUNCTIONS------------------------//
//____________________________________________________________________________//
