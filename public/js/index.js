$(document).ready(function() {
	// var username;
	// If there is a username in localStorage use it, if not set to hardcoded user.
	// if (localStorage.username) {
	// 	username = localStorage.username;
	// }
	// else {
	// 	username = "Daniel";
	// }

	// addUsername();
  deleteUser();
  editUser();
	asyncFunctions();
	searchEventListener();

  closeDelete();
	if (document.title == "Chaplain | Chaplain Stories") {
		loadChaplainImage(); // Gets image from API
		loadChaplainDocs(); // Gets info from API
	}
	else if (document.title == "Search | Chaplain Stories") {
		loadChaplainDocs(); // Gets info from API
	}

//_______________________________________________________________________//
//----------------------------Editing Chaplain---------------------------//
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
	var chaplainEditModal = document.getElementById('chaplainEdit');

	var accountEditModal = document.getElementById('accountEdit');

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	var timelineID = document.getElementById("timelineID");

	$(".timelineEntry").click(function() {
		timelineEditModal.style.display = "block";
		timelineEditModal.animate([
			// keyframes
			{ opacity: '0', transform: 'scale3d(0.3, 0.3, 0.3)', background: 'rgba(0,0,0,0)' },
			{ opacity: '1', transform: 'scale3d(1, 1, 1)', background: 'rgba(0,0,0,0.4)' }
		], {
			// timing options
			duration: 250,
			iterations: 1
		});
		timelineID.value = this.id;
	});

	$("#addEvent").click(function() {
		timelineAddModal.style.display = "block";
		timelineAddModal.animate([
			// keyframes
			{ opacity: '0', transform: 'scale3d(0.3, 0.3, 0.3)', background: 'rgba(0,0,0,0)' },
			{ opacity: '1', transform: 'scale3d(1, 1, 1)', background: 'rgba(0,0,0,0.4)' }
		], {
			// timing options
			duration: 250,
			iterations: 1
		});
	});

	$("#general").click(function() {
		chaplainEditModal.style.display = "block";
		chaplainEditModal.animate([
			// keyframes
			{ opacity: '0', transform: 'scale3d(0.3, 0.3, 0.3)', background: 'rgba(0,0,0,0)' },
			{ opacity: '1', transform: 'scale3d(1, 1, 1)', background: 'rgba(0,0,0,0.4)' }
		], {
			// timing options
			duration: 250,
			iterations: 1
		});
	});

	$("#account").click(function() {
		accountEditModal.style.display = "block";
		accountEditModal.animate([
			// keyframes
			{ opacity: '0', transform: 'scale3d(0.3, 0.3, 0.3)', background: 'rgba(0,0,0,0)' },
			{ opacity: '1', transform: 'scale3d(1, 1, 1)', background: 'rgba(0,0,0,0.4)' }
		], {
			// timing options
			duration: 250,
			iterations: 1
		});
	});

	// When the user clicks on <span> (x), close the modal
	// span.onclick = function() {
	$(".close").click(function() {
		timelineEditModal.style.display = "none";
		timelineAddModal.style.display = "none";
		chaplainEditModal.style.display = "none";
	});

	$(".close3").click(function() {
		accountEditModal.style.display = "none";
	});
//---------------------------End Editing Chaplain-------------------------//
//___________________________________________________________________-____//

	/**
	 * Replaced defualt "user" text with actual username.
	 */
	// function addUsername() {
	// 	$(".username").text(username);
	// }

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
});

/**
 * Toggles new form input if Catholic is selected
 * @param faith_type	Option chosen for denomination.
 */
function showOrderInput(faith_type) {
  if (faith_type == 1) { // Catholic chosen
    document.getElementById('order').innerHTML = '<fieldset><legend>Order*</legend>' +
      '<input type="text" name="faith" required="required" placeholder="Enter Faith..."></fieldset>';
  } else { // Other chosen
    document.getElementById('order').innerHTML = '';
  }
}

//______________________________________________________________________________//
//----------------------------Chronicling America API---------------------------//
/**
 * Loads in documents for the Chaplain being viewed.
 */
function loadChaplainDocs() {
  $("#chaplain-docs").append("<p>Loading results for " + $("#chaplain-name").text() + "</p>");
  var displayObjects = [];
  var i = 0;
  while (i < 20) {
    ajaxCall($("#chaplain-name").text(), i + 1, displayObjects);
    i++;
  }
}

/**
 * Event listener for the search button on the search page.
 */
function searchEventListener() {
  $("#searchbtn").click(function() {
    if ($("#searchbox").val() != '') {
      searchNewspapers($("#searchbox").val());
    }
  });
}

/**
 * Makes a function call to load search results.
 * @param query		Stores the search query.
 */
function searchNewspapers(query) {
  $("#search-documents").empty();
  $("#search-documents").append("<p>Loading results for " + query + "</p>");
  var displayObjects = []; //array where results are kept
  var i = 0;
  // Load results from the first 20 pages
  while (i < 20) {
    ajaxCall(query, i + 1, displayObjects);
    i++;
  }
}

/**
 * Displays the reults from the search query on the search page and chaplain view.
 * @param objectarray	Stores the items to be displayed.
 */
function displayResults(objectarray) {
  $("#search-documents").empty();
  $("#chaplain-docs").empty();
  if (objectarray.length == 0) {
    $("#search-documents").append("<p>No results found</p>");
    $("#chaplain-docs").append("<p>No Documents found</p>");
  }
  objectarray.forEach(function(e) {
    $("#search-documents").append('<hr><article class="search-result"> ' +
      '<h3><a href="' + e.link + '" target="_blank">' + e.title + '</a></h3>' +
      '<h5>' + e.location + '</h5>' +
      '<h5>' + e.date + '</h5>' +
      '</article>')

    $("#chaplain-docs").append('<a href="' + e.link + '" target="_blank">' + e.title + '</a> <br>');
  })
}

/**
 * This function makes an ajax call to the chroniclingamerica.loc.gov api.
 * @param query				Search query from user.
 * @param number			Stores the number of items to be displayed.
 * @param displayObjects	Stores the items to be displayed.
 */
function ajaxCall(query, number, displayObjects) {
  // Make an ajax call to the chroniclingamerica api and load results into an array
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

/**
 * Makes first letters uppercase.
 * Source: https://stackoverflow.com/a/4878800
 * @param str	String to be converted.
 */
function toTitleCase(str) {
  return str.replace(/\w\S*/g, function(txt) {
    return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
  });
}
//---------------------------End Chronicling America API------------------------//
//______________________________________________________________________________//

//----------------------START OF AJAX ASYNC FUNCTIONS-------------------------//
//____________________________________________________________________________//

/**
 * Async delete function
 */
function deleteUser() {
  $("#deleteUser").click(function(e) {
    $("#deleteView").show();
  });
}
function editUser() {
  $("#editPerm").click(function(e) {
    $("#editView").show();
  });
}
function closeDelete() {
  $("#deleteView").hide();
  $("#editView").hide();
}

/**
 * Async loading functions.
 */
function asyncFunctions() {
  $("#submitEdit").click(function(e) {
    e.preventDefault();
    var name = $("#nameSubmit").val();
    var faith = $("#faithSubmit").val();
    var faith_type = $("#faithTypeSubmit").val();
    var rank = $("#rankSubmit").val();
    var hometown = $("#homeSubmit").val();

    if (name === '' || faith_type === '' || rank === '' || hometown === '' || faith === '') {
      alert("Please fill out all necessary information");
    } else {
      $.ajax({
        url: window.location.origin + "/bojanglers/app/controller/postInfo.php",
        type: "POST",
        data: {
          "name": name,
          "faith": faith,
          "faith_type": faith_type,
          "rank": rank,
          "hometown": hometown
        },
        success: function(result) {
          $("#editView").hide();
          $("#celebTable").append("<tr>" + "<td>" + name + "</td>" +
            "<td>" + faith + "</td>" +
            "<td>" + rank + "</td>" +
            "<td>" + hometown + "</td>" + "</tr>");
        }
      })
    }
  });

  var infoAddModal = document.getElementById('editView');

  $("#addEntry").click(function() {
    infoAddModal.style.display = "block";
    infoAddModal.animate([
      // keyframes
      {
        opacity: '0',
        transform: 'scale3d(0.3, 0.3, 0.3)',
        background: 'rgba(0,0,0,0)'
      },
      {
        opacity: '1',
        transform: 'scale3d(1, 1, 1)',
        background: 'rgba(0,0,0,0.4)'
      }
    ], {
      // timing options
      duration: 250,
      iterations: 1
    });
  });

  $(".close2").click(function() {
    infoAddModal.style.display = "none";
  });

  $.ajax({
    method: "GET",
    url: window.location.origin + "/bojanglers/app/controller/info.php",
  }).done(function(data) {

    var result = $.parseJSON(data);
    var string = "<table id = \"celebTable\">" + "<tr>" +
      "<th>NAME</th>" +
      "<th>FAITH</th>" +
      "<th>RANK</th>" +
      "<th>HOMETOWN</th>" +
      "</tr>";

    //from result create a string of data and append to the div
    $.each(result, function(key, value) {
      if (value['faith']) {
        string = string + "<tr>" + "<td>" + value['name'] + "</td>" +
          "<td>" + value['faith'] + "</td>" +
          "<td>" + value['rank'] + "</td>" +
          "<td>" + value['hometown'] + "</td>" + "</tr>";
      } else {
        string = string + "<tr>" + "<td>" + value['name'] + "</td>" +
          "<td>" + "Unknown" + "</td>" +
          "<td>" + value['rank'] + "</td>" +
          "<td>" + value['hometown'] + "</td>" + "</tr>";
      }

    });
    string += '</table>';
    $("#content").html(string);
  }).fail(function(data) {
    console.log("error in the get");
  });
}
//----------------------END OF AJAX ASYNC FUNCTIONS---------------------------//
//____________________________________________________________________________//

//______________________________________________________________________________//
//--------------------------------Wikipedia API---------------------------------//
/**
 * Calls get function for Chaplain Image.
 */
function loadChaplainImage() {
  getWikiImage($("#chaplain-name").text());
}

/**
 * Gets image from Wikipedia and inserts it into the page if found.
 * @param title 	The name of the Chaplain.
 */
function getWikiImage(title) {
  $.ajax({
    url: 'https://en.wikipedia.org/w/api.php',
    dataType: 'jsonp',
    data: {
      action: 'query',
      prop: 'pageimages',
      format: 'json',
      piprop: 'original',
      titles: title
    },
    success: function(response) {
      var image = response.query.pages[Object.keys(response.query.pages)[0]].original.source;
      if (image) {
        document.getElementsByClassName("profile-picture")[0].src = image;
      } else {
        console.log('the property is not available...');
      }
    }
  });
}
//-------------------------------End Wikipedia API-------------------------------//
//______________________________________________________________________________//
