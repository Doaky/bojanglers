<main class="panda">

	<div id="timelineAdd" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/panda/edit_timeline/" method="POST">
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
				<input class="hide-info" type="number" name="pandaID" value="<?= $panda->id ?>">

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

			<form action="<?= BASE_URL ?>/panda/edit_timeline/" method="POST">
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
				<input class="hide-info" type="number" name="pandaID" value="<?= $panda->id ?>">

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

			<form action="<?= BASE_URL ?>/panda/edit_panda/" method="POST">
				<fieldset>
					<legend>Name</legend>
					<input type="text" name="name" value="<?= $panda->name ?>">
				</fieldset>

				<fieldset>
					<legend>Location</legend>
					<input type="text" name="location" value="<?= $panda->location ?>">
				</fieldset>

				<fieldset>
					<legend>Born</legend>
					<input type="number" name="born" min="0" value="<?= $panda->born ?>">
				</fieldset>

				<fieldset>
					<legend>Died</legend>
					<input type="number" name="died" min="0" value="<?= $panda->died ?>">
				</fieldset>

				<fieldset>
					<legend>Parents</legend>
					<textarea rows="4" cols="50" name="parents"><?= $panda->parents ?></textarea>
				</fieldset>

				<fieldset>
					<legend>Siblings</legend>
					<textarea rows="4" cols="50" name="siblings"><?= $panda->siblings ?></textarea>
				</fieldset>

				<fieldset>
					<legend>Children</legend>
					<textarea rows="4" cols="50" name="children"><?= $panda->children ?></textarea>
				</fieldset>

				<fieldset>
					<legend>File</legend>
					<input type="text" name="file" value="<?= $panda->file ?>">
				</fieldset>

				<input class="hide-info" type="number" name="id" value="<?= $panda->id ?>">

				<br><br>
				
				<input type="submit" class="submitButton" value="Add Changes" name="save" />
				<input type="submit" class="deleteButton" value="Delete Panda" name="delete" />
			</form>
		</div>
	</div>

	<div id="documentAdd" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/panda/edit_document/" method="POST">
				<fieldset>
					<legend>Title</legend>
					<input type="text" name="title">
				</fieldset>

				<fieldset>
					<legend>Location</legend>
					<input type="text" name="location">
				</fieldset>

				<fieldset>
					<legend>Date</legend>
					<input type="date" name="date">
				</fieldset>

				<fieldset>
					<legend>File</legend>
					<input type="text" name="file">
				</fieldset>

				<input class="hide-info" type="number" name="pandaID" value="<?= $panda->id ?>">

				<br><br>

				<input type="submit" class="submitButton" value="Add Document" name="save" />
			</form>
		</div>
	</div>

	<div id="documentEdit" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<br><br>

			<form action="<?= BASE_URL ?>/panda/edit_document/" method="POST">
				<fieldset>
					<legend>Title</legend>
					<input type="text" name="title">
				</fieldset>

				<fieldset>
					<legend>Location</legend>
					<input type="text" name="location">
				</fieldset>

				<fieldset>
					<legend>Date</legend>
					<input type="date" name="date">
				</fieldset>

				<input class="hide-info" id="documentID" type="number" name="id" value="0">
				<input class="hide-info" type="number" name="pandaID" value="<?= $panda->id ?>">

				<br><br>

				<input type="submit" class="submitButton" value="Add Changes" name="save" />
				<input type="submit" class="deleteButton" value="Delete Document" name="delete" />
			</form>
		</div>
	</div>

	<section class="left">
		<h1><?= $panda->name ?></h1>

		<figure class="profile-picture-container">
			<?php if($panda->file != null): ?>
				<img class="profile-picture" src="<?= BASE_URL ?>/public/img/pandas/<?= $panda->name ?>/<?= $panda->file ?>" alt="Panda Profile Picture"/><br>
			<?php else: ?>
				<img class="profile-picture" src="<?= BASE_URL ?>/public/img/placeholder.jpg" alt="Profile Picture"/><br>
			<?php endif; ?>
			
		</figure>
		<h3><a href="#"><?= $panda->location ?></a></h3>

		<?php if($panda->died != null): ?>
			<h3><?= $panda->born ?> - <?= $panda->died ?></h3>
		<?php else: ?>
			<h3><?= $panda->born ?> - Present</h3>
		<?php endif; ?>
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
		<h4>Relatives:</h4>
		<ul>
			<li class="list-title">Parents:</li>
			<?php if($panda->parents != null): ?>
				<?php foreach(explode(",", $panda->parents) as $p): ?>
					<li><?= $p ?></li>
				<?php endforeach; ?>
			<?php else: ?>
				<li>None</li>
			<?php endif; ?>
		</ul>
		<ul>
			<li class="list-title">Siblings:</li>
			<?php if($panda->siblings != null): ?>
				<?php foreach(explode(",", $panda->siblings) as $s): ?>
					<li><?= $s ?></li>
				<?php endforeach; ?>
			<?php else: ?>
				<li>None</li>
			<?php endif; ?>
		</ul>
		<ul> 
			<li class="list-title">Children:</li>
			<?php if($panda->children != null): ?>
				<?php foreach(explode(",", $panda->children) as $c): ?>
					<li><?= $c ?></li>
				<?php endforeach; ?>
			<?php else: ?>
				<li>None</li>
			<?php endif; ?>
		</ul>
	</section>

	<section class="right">
		<h4>Documents:</h4>
		<?php if(isset($_SESSION['username'])): ?>
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
		</figure>
	</section>

</main>