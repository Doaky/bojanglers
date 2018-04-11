<main class="search-page">
		<button id="addEntry">ADD ENTRY</button>
		
		<div id="editView" class="modal">
	  		<div id="editContent" class="modal-content">
				<span class="close2" id="#close2">&times;</span>
				<br><br>
				<form id="formOrder">
					<fieldset>
						<legend>Name</legend>
						<input type="text" id="nameSubmit" placeholder="Enter Name...">
					</fieldset>

					<fieldset>
						<legend>Hometown</legend>
						<input type="text" id="homeSubmit" placeholder="Enter Hometown...">
					</fieldset>

					<fieldset>
						<legend>Rank</legend>
						<input type="text" id="rankSubmit" placeholder="Enter Rank...">
					</fieldset>

					<fieldset>
						<legend>Denomination*</legend>
						<select id="faithTypeSubmit" required="required" onchange="showOrderInput(this.options[this.selectedIndex].value)">
							<option value="0">Jewish</option>
							<option value="1">Catholic</option>
							<option value="2">Protestant</option>
						</select>
					</fieldset>
					
					<fieldset><legend>Order</legend>
						<input type="text" id="faithSubmit" required="required" placeholder="Enter Faith...">
					</fieldset>

					<br><br>

					<input id="submitEdit" type="submit" class="submitButton" value="Submit" name="save" />
				</form>
			</div>
		</div>

	</br>
	<section class="left">
		<div id="content">
			<h2 class="title">Chaplains:</h2>
		</div>

		<div id="users">
			<h2 class="title">Users:</h2>
			<?php foreach($users as $u): ?>
				<article class="user">
					<?php if($u->permission == 0): ?>
						<h4><a href="<?= BASE_URL ?>/user/<?= $u->id ?>"><?= $u->username ?></a> - Admin</h4>
					<?php else: ?>
						<h4><a href="<?= BASE_URL ?>/user/<?= $u->id ?>"><?= $u->username ?></a></h4>
						<!-- TODO Make this functional -->
						<?php if($_SESSION['admin'] == 0): ?>
							<?php if($u->permission == 2): ?>
								<button id="<?= $u->id ?>" class="promote button">Promote</button>
							<?php elseif($u->permission == 1): ?>
								<button id="<?= $u->id ?>" class="demote button">Demote</button>
							<?php endif; ?> 
						<?php endif; ?>
					<?php endif; ?>
				</article>
			<?php endforeach; ?>
		</div>
	</section>

	<section class="right">
		<h2 class="title">Activity:</h2>
		<?php foreach($actions as $a): ?>
			<article class="action">
				Item was <?= $a->actionType ?> by <?= $a->fkUser ?>
			</article>
		<?php endforeach; ?>
	</section>

</main>
