<main class="account-page">

	<div class="background-image"></div>
	
	<section class="left">
		<h1><?= $user->username ?></h1>

		<?php if(isset($_SESSION['username'])): ?>
			<?php if($following == false): ?>
				<form method="POST" action="<?= BASE_URL ?>/user/addFollower/">
					<input class="hide-info" type="number" name="fkFollower" value="<?= $_SESSION['userID'] ?>">
					<input class="hide-info" type="number" name="fkFollowed" value="<?= $user->id ?>">
					<input class="button" type="submit" name="submit" value="Follow +">
				</form>
			<?php elseif($following == true): ?>
				<form method="POST" action="<?= BASE_URL ?>/user/removeFollowing/">
					<input class="hide-info" type="number" name="fkFollower" value="<?= $_SESSION['userID'] ?>">
					<input class="hide-info" type="number" name="fkFollowed" value="<?= $user->id ?>">
					<input class="button" type="submit" name="submit" value="Unfollow -">
				</form>
			<?php endif; ?>
		<?php endif; ?>

		<?php if($user->permission == 1): ?>
			<h4>Admin</h4> <br><br>
		<?php elseif($user->permission == 2): ?>
			<h4>Founder</h4> <br><br>
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
			<?php if($followers != null): ?>
				<?php foreach($followers as $f): ?>
					<h4> <a href="<?= BASE_URL ?>/user/<?= $f->id ?>"><?= $f->username ?></a></h4><br>
				<?php endforeach; ?>
			<?php else: ?>
				<h4>None</h4>
			<?php endif; ?>
		</div>
	</section>
	<section class="right">
		<h2 class="activity-title">Activity:</h2>
		<div class="activity">
		</div>
	</section>
</main>
