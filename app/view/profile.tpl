<main class="account-page">

	<div class="background-image"></div>
	
	<?php if(isset($_SESSION['username'])): ?>
		<section class="logged-in">
			<section class="left">
				<h5><i>Welcome Back, </i><i class="username"><?= $_SESSION['username'] ?>!</i></h5>
				<h4>Email:</h4> <br>
				<h4>Role:</h4>
			</section>
			<section class="right">
				<h2 class="activity-title">Activity:</h2>
				<div class="activity">
				</div>
			</section>
		</section>
	<?php else: ?>
		<h5 class="logged-out"><i>New Here? <a href="#">Create an Account</a> or <a href="<?= BASE_URL ?>/login/">Sign In</a> for all features</i></h5>
	<?php endif; ?>
</main>
