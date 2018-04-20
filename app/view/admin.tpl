<main class = "users">
	<h1>Users</h1>
	<?php if($_SESSION['admin'] == 1 OR $_SESSION['admin'] == 2): ?>
	<button type="button" id = "deleteUser" class = "button">Delete User</button>
	<button type="button" id = "editPerm" class = "button">Edit Permissions</button>
	<?php endif; ?>
	<p></p>
	<aside class="b-results">
		<table id = "celebTable">
			<th>User Id</th>
			<th>Username</th>
			<th>User Permissions</th>
			<th>Email</th>
			<?php foreach($users as $entry) {
				if($entry->username != $_SESSION['username']) {
					echo('<tr>');
					echo('<td>'.$entry->id.'</td>');
					echo('<td><a href="'.BASE_URL.'/user/'.$entry->id.'">'.$entry->username.'</a></td>');
					if ($entry->permission == 1) {
						echo('<td>Admin</td>');
					}
					elseif ($entry->permission == 2) {
						echo('<td>Founder</td>');
					}
					else {
						echo('<td>Registered User</td>');
					}
					echo('<td>'.$entry->email.'</td>');
					echo('<tr>');
				}
			}
		?>
		</table>
	</aside>
	<br>
<div class="promptWindow" id="deleteView">
	<div class="promptContent" id="deleteContent">
		<span onClick="closeDelete()" class="close">&times;</span>
		<form action="<?= BASE_URL ?>/deleteuser/process" method="DELETE">
			<p id="editDirections">Are you sure you would like to delete this entry?</p><br>
			<select name="id" id="deleteOptions">

			 <?php foreach($users as $entry) {
					 if($entry->username != $_SESSION['username']) {
							echo('<option value = "'.$entry->id.'" >'.$entry->username.'</option>');
						}
					}?>


		 </select><br>
			<div id="confirmButton">
				<button id="yes" class="button">CONFIRM</button>
			</div>
		</form>
	</div>
</div>

<div class="promptWindow" id="editViewAdmin">
	<div class="modal-content" id="editContentAdmin">
		<span onClick="closeDelete()" class="close">&times;</span>
		<form action="<?= BASE_URL ?>/edituser/process" method="POST">
			<p id="editDirections">Are you sure you would like to change this users permission?</p><br>
			<select name="id" id="editOptions">

			 <?php foreach($users as $entry) {
					 if($entry->username != $_SESSION['username']) {
							echo('<option value = "'.$entry->id.'" >'.$entry->username.'</option>');
						}
					}?>
		 </select><br>
		 <p>Status</p>
		 <select  name="permission" id = "permissionOptions">
			 <option value="0">Registered User</option>
			 <option value= "1">Admin</option>
			 <?php if($_SESSION['admin'] == 2) {
				 echo('<option value="2">Founder</option>');
			 } ?>
		 </select>
		 <br><br>
			<div id="confirmButton">
				<button id="yes" class="button">CONFIRM</button>
			</div>
		</form>
	</div>
</div>
	<!-- <?php if(!empty($users)) {
		echo('<button id = "submit-changes">Submit Changes </button>');
	} ?> -->
</main>
