<main class="add-page">
	
	<div id="add" class="background-image"></div>

	<?php if(isset($_SESSION['username'])): ?>

		<div class="logged-in">

			<form action="<?= BASE_URL ?>/chaplain/add/process/" method="POST">

				<section class="left">
					<h4>Picture:</h4>
					<figure class="profile-picture-container">
						<img class="profile-picture" src="<?= BASE_URL ?>/public/img/placeholder.jpg" alt="Profile Picture"/><br>
					</figure>
					<input class="file-upload" type="file" accept="image/*" name="file"/>
				</section>

				<section class="middle">
					<h4>Chaplain Information:</h4>
					
					<br><br>
					<div id="add-form">
						<fieldset>
							<legend>Name*</legend>
							<input type="text" name="name" required="required" placeholder="Enter Name..."></label>
						</fieldset>

						<fieldset>
							<legend>Hometown</legend>
							<input type="text" name="hometown" placeholder="Enter Hometown...">
						</fieldset>

						<fieldset>
							<legend>Rank</legend>
							<input type="text" name="rank" placeholder="Enter Rank...">
						</fieldset>

						<fieldset>
							<legend>Denomination*</legend>
							<select name="faith_type" required="required" onchange="showOrderInput(this.options[this.selectedIndex].value)">
								<option disabled selected value>Select a Denomination</option>
								<option value="0">Jewish</option>
								<option value="1">Catholic</option>
								<option value="2">Protestant</option>
							</select>
						</fieldset>
						
						<div id="order">
						</div>
					</div>

				</section>
				
				<input id="add-submit" class="button" type="submit" value="Add Chaplain">

			</form>

		</div>
	<?php else: ?>
		<section class="logged-out error-messaage">
			<h2>Error. Please <a href="<?= BASE_URL ?>/login/">Sign In</a> To Continue.</h2>
		</section>
	<?php endif; ?>
</main>
