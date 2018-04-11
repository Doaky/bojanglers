<main class="account-page">

	<div id="accountEdit" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close3">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/user/editaccount/" method="POST">
				<fieldset>
					<legend>Email</legend>
					<input type="email" name="email" value="<?= $user->email ?>">
				</fieldset>

				<fieldset>
					<legend>First Name</legend>
					<input type="text" name="firstName" value="<?= $user->firstName ?>">
				</fieldset>

				<fieldset>
					<legend>Last Name</legend>
					<input type="text" name="lastName" value="<?= $user->lastName ?>">
				</fieldset>

				<fieldset>
					<legend>Description</legend>
					<select name="education" value="<?= $user->education ?>">
						<option disabled selected value>Select an Education Level</option>
						<option value="0">Less than High School</option>
						<option value="1">High School</option>
						<option value="2">Some College</option>
						<option value="3">Bachelors Degree</option>
						<option value="4">Graduate Degree</option>
					</select>
				</fieldset>
				
				<input class="hide-info" type="text" name="username" value="<?= $user->username ?>">
				<input class="hide-info" type="text" name="password" value="<?= $user->password ?>">
				<input class="hide-info" type="number" name="id" value="<?= $user->id ?>">

				<br><br>

				<input type="submit" class="submitButton" value="Submit Changes" name="save" />
			</form>
		</div>
	</div>

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

			<?php if($user->education === 0): ?>
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

			<button class="button" id="account">Edit Profile</button> <br> <br>

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
