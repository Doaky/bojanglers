<main class="home-page">

	<div class="background-image"></div>

	<section id="title">
		<img id="logo" src="<?= BASE_URL ?>/public/img/logo.png" alt="Chaplain Stories Logo">
		<h1 class="title-text">Chaplain Stories</h1> <br>
		<h3>Community, Comfort, Combat</h3>
	</section>
	
	<?php if(isset($_SESSION['username'])): ?>
		<h5 class="logged-in"><i>Welcome Back, </i><i class="username">User</i>!</h5>
	<?php else: ?>
		<h5 class="logged-out"><i>New Here? <a href="#">Create an Account</a> or <a href="<?= BASE_URL ?>/login/"">Sign In</a> for all features</i></h5>
	<?php endif; ?>
	<br>

	<form action="<?= BASE_URL ?>/search/">
		<label for="home-search">Search:</label>
		<input id="home-search" type="search" name="search">
	</form>

	<h5>or</h5>
	<?php if(isset($_SESSION['username'])): ?>
		<a href="<?= BASE_URL ?>/addchaplain/">
			<button class="logged-in" id="create-zoo">Add New Chaplain</button>
		</a>
	<?php else: ?>
		<h5 class="logged-out"><i><a href="<?= BASE_URL ?>/login/"">Sign In</a> to Add or Edit Data</i></h5>
	<?php endif; ?>

</main>