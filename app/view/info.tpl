<main class="search-page">
	<!-- <div id="upperSection"> -->
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

	<!-- </div> -->

	</br>
	<section class="left">
		<div id="content">
		</div>
	</section>

	<section class="right">
		<h2 class="activity-title">Activity:</h2>
	</section>

</main>
