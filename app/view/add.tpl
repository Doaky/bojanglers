<main class="add-panda-page">
	
	<div id="add-panda" class="background-image"></div>

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
					<!-- date type works in Chrome and Firefox. -->
					<label>*Born: <input type="number" min="0" max="2019" name="born" required="required"></label><br>
					<label>Died: <input type="number" min="0" max="2019" name="died"></label><br>
					<label>Denomination: <input type="text" name="location"></label><br>
					<label>Rank: <input type="text" name="location"></label><br>
					<aside class="event-container">
					</aside>
					<!-- <button id="add-event">Add Event</button> -->
				</section>
				
				<!-- Kept for future implementation -->
				<!-- <section class="right">
					<h4 class="add-documents">Documents:</h4>
					<figure class="document-display add-documents">
					</figure>
					<button class="add-documents">Upload Document</button>
				</section> -->

				<input id="add-panda-submit" class="button" type="submit" value="Add Chaplain">

			</form>

		</div>
	<?php else: ?>
		<section class="logged-out error-messaage">
			<h2>Error. Please <a href="<?= BASE_URL ?>/login/">Sign In</a> To Continue.</h2>
		</section>
	<?php endif; ?>
</main>
