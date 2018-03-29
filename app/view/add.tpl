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
					<label>*Name: <input type="text" name="name" required="required" placeholder="Enter Name..."></label><br>
					<label>*Denomination: 
						<select name="faith_type" required="required">
							<option disabled selected value>Select a Denomination</option>
							<option value="0">Jewish</option>
							<option value="1">Catholic</option>
							<option value="2">Protestant</option>
						</select>
					</label><br>
					<label>*Order: <input type="text" name="faith" required="required" placeholder="Enter Faith..."></label><br>
					<!-- TODO Change to dropdown? -->
					<label>Rank: <input type="text" name="rank" placeholder="Enter Rank..."></label><br>
					<label>Hometown: <input type="text" name="hometown" placeholder="Enter Hometown..."></label><br>

					<!-- date type works in Chrome and Firefox. -->
					<!-- <label>*Born: <input type="number" min="0" max="2019" name="born" required="required"></label><br>
					<label>Died: <input type="number" min="0" max="2019" name="died"></label><br> -->
					
					<!-- <aside class="event-container">
					</aside> -->
					<!-- <button id="add-event">Add Event</button> -->
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
