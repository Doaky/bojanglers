<main class="panda">

	<div id="timelineAdd" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/chaplain/edittimeline/" method="POST">
				<fieldset>
					<legend>Year</legend>
					<input type="number" name="year">
				</fieldset>

				<fieldset>
					<legend>Title</legend>
					<input type="text" name="title">
				</fieldset>

				<fieldset>
					<legend>Description</legend>
					<textarea rows="4" cols="50" name="description"></textarea>
				</fieldset>

				<input class="hide-info" type="number" name="id" value="0">
				<input class="hide-info" type="number" name="chaplainID" value="<?= $chaplain->id ?>">

				<br><br>

				<input type="submit" class="submitButton" value="Add Event" name="save" />
			</form>
		</div>
	</div>

	<div id="timelineEdit" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/chaplain/edittimeline/" method="POST">
				<fieldset>
					<legend>Year</legend>
					<input type="number" name="year">
				</fieldset>

				<fieldset>
					<legend>Title</legend>
					<input type="text" name="title">
				</fieldset>

				<fieldset>
					<legend>Description</legend>
					<textarea rows="4" cols="50" name="description"></textarea>
				</fieldset>

				<input class="hide-info" id="timelineID" type="number" name="id" value="0">
				<input class="hide-info" type="number" name="chaplainID" value="<?= $chaplain->id ?>">

				<br><br>

				<input type="submit" class="submitButton" value="Add Changes" name="save" />
				<input type="submit" class="deleteButton" value="Delete Event" name="delete" />
			</form>
		</div>
	</div>

	<div id="pandaEdit" class="modal">
	 	<!-- Modal content -->
	 	<div class="modal-content">
			<span class="close">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/chaplain/editchaplain/" method="POST">
				<fieldset>
					<legend>Name</legend>
					<input type="text" name="name" value="<?= $chaplain->name ?>">
				</fieldset>

				<fieldset>
					<legend>Hometown</legend>
					<input type="text" name="hometown" value="<?= $chaplain->hometown ?>">
				</fieldset>

				<fieldset>
					<legend>Rank</legend>
					<input type="text" name="rank" value="<?= $chaplain->rank ?>">
				</fieldset>

				<fieldset>
					<legend>Denomination</legend>
					<select name="faith_type" value="<?= $chaplain->faith_type ?>" required="required" onchange="showOrderInput(this.options[this.selectedIndex].value)">
						<option value="0">Jewish</option>
						<option value="1">Catholic</option>
						<option value="2">Protestant</option>
					</select>
				</fieldset>

				<div id="order">
				</div>

				<fieldset>
					<legend>File</legend>
					<input type="text" name="file" value="<?= $chaplain->file ?>">
				</fieldset>

				<input class="hide-info" type="number" name="id" value="<?= $chaplain->id ?>">

				<br><br>

				<input type="submit" class="submitButton" value="Add Changes" name="save" />
				<input type="submit" class="deleteButton" value="Delete Chaplain" name="delete" />
			</form>
		</div>
	</div>

	<section class="left">
		<h1 id = "chaplain-name"><?= $chaplain->name ?></h1>

		<figure class="profile-picture-container">
			<?php if($chaplain->file != null): ?>
				<img class="profile-picture" src="<?= BASE_URL ?>/public/img/chaplains/<?= $chaplain->name ?>/<?= $chaplain->file ?>" alt="Chaplain Profile Picture"/><br>
			<?php else: ?>
				<img class="profile-picture" src="<?= BASE_URL ?>/public/img/placeholder.jpg" alt="Profile Picture"/><br>
			<?php endif; ?>

		</figure>

		<h3>
			<?php if($chaplain->hometown != null): ?>
				<a><?= $chaplain->hometown ?></a>
			<?php else: ?>
				<a>Unknown Hometown</a>
			<?php endif; ?>
		</h3>

		<h3>
			<?php if($chaplain->rank != null): ?>
				<a><?= $chaplain->rank ?></a>
			<?php else: ?>
				<a>Unknown Rank</a>
			<?php endif; ?>
		</h3>

		<h3>
			<?php if($chaplain->faith_type == 0): ?>
				Jewish
			<?php elseif($chaplain->faith_type == 1): ?>
				Catholic - <?= $chaplain->faith ?>
			<?php elseif($chaplain->faith_type == 2): ?>
				Protestant
			<?php endif; ?>
		</h3>

		<!-- <?php if($chaplain->died != null): ?>
			<h3><?= $chaplain->born ?> - <?= $chaplain->died ?></h3>
		<?php else: ?>
			<h3><?= $chaplain->born ?> - Present</h3>
		<?php endif; ?> -->

		<br>

		<?php if(isset($_SESSION['username'])): ?>
			<button class="logged-in button" id="edit">Edit</button>
			<button class="editing button" id="general">Edit Info</button>
			<button class="editing button" id="done">Done</button>
		<?php endif; ?>

		<hr>
		<h4>Timeline:</h4>
		<?php if(isset($_SESSION['username'])): ?>
			<button id="addEvent" class="editing button">Add Event</button>
		<?php endif; ?>
		<br><br>
		<aside class="timeline">
			<?php foreach($timelineEntries as $te): ?>
				<article class="timeline-entry">
					<h4><?= $te->year ?> - <?= $te->title ?></h4>
					<?php if(isset($_SESSION['username'])): ?>
						<button id="<?= $te->id ?>" class="editing timelineEntry button">Edit Event</button>
					<?php endif; ?>
					<p><?= $te->description ?></p>
				</article>
			<?php endforeach; ?>
		</aside>
	</section>

	<section class="middle">
		<h4>Documents:</h4>
		<figure class = "document-display" id = "chaplain-docs">

		</figure>
		<!-- <?php if(isset($_SESSION['username'])): ?>
			<button id="addDocument" class="editing button">Add Document</button>
		<?php endif; ?>
		<br><br>
		<figure class="document-display">
			<?php foreach($documents as $d): ?>
				<a id="<?= $d->id ?>" href="<?= BASE_URL ?>/public/img/pandas/<?= $d->file ?>" target="_blank"><?= $d->title ?></a>
				<?php if(isset($_SESSION['username'])): ?>
					<button id="<?= $d->id ?>" class="editing documentEntry button">Edit</button>
				<?php endif; ?>
				<br>
			<?php endforeach; ?>
		</figure> -->
	</section>

	<!-- <section class="right">

	</section> -->

</main>
