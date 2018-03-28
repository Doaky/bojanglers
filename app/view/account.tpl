<main class="home-page">

	<div class="background-image"></div>
	
	<?php if(isset($_SESSION['username'])): ?>
		<section class="logged-in">
			<h5><i>Welcome Back, </i><i class="username">User</i>!</h5>
			<label for="new-user">Enter New Username:</label>
			<input id="new-user" type="text" name="username">
			<button id="save">Save</button>
		</section>
	<?php else: ?>
		<h5 class="logged-out"><i>New Here? <a href="#">Create an Account</a> or <a href="<?= BASE_URL ?>/login/">Sign In</a> for all features</i></h5>
	<?php endif; ?>
</main>

<script>
	// Saves a new username to browser's local storage
	function saveUsername(newUser) {
		// Save entry
		localStorage.setItem("username", newUser);
		// Update display
		$(".username").text(newUser);
	}

	// When the save button is clicked, get the input value and call function.
	$("#save").click(function() {
		saveUsername(document.getElementById('new-user').value)
	});
</script>
