<main class="account-page">

	<div class="background-image"></div>
	
	<section class="logged-in">
		<section class="left">
			<h1><?= $user->username ?></h1>

			<?php if($user->permission == 0): ?>
				<h4>Admin</h4> <br><br>
			<?php endif; ?>

			<?php if($user->firstName != null AND $user->firstName != null): ?>
				<h4>Name: <?= $user->firstName ?> <?= $user->lastName ?></h4> <br>
			<?php elseif($user->firstName != null): ?>	
				<h4>Name: <?= $user->firstName ?></h4> <br>
			<?php elseif($user->lastName != null): ?>	
				<h4>Name: <?= $user->lastName ?></h4> <br>
			<?php endif; ?>

			<h4>Email: <?= $user->email ?></h4> <br>

			<?php if($user->education == 0): ?>
				<h4>Education: Less than High School</h4> <br>
			<?php elseif($user->education == 1): ?>
				<h4>Education: High School</h4> <br>
			<?php elseif($user->education == 2): ?>
				<h4>Education: Some College</h4> <br>
			<?php elseif($user->education == 3): ?>
				<h4>Education: Bachelors</h4> <br>
			<?php elseif($user->education == 4): ?>
				<h4>Education: Graduate</h4> <br>
			<?php endif; ?>

			<h4>Date Joined: <?= $user->date_created ?></h4> <br> <br>

			<h3>Followers:</h3>
			<div class="follower-list">
			</div>
		</section>
		<section class="right">
			<h2 class="activity-title">Activity:</h2>
			<div class="activity">
			</div>
		</section>
	</section>
</main>
