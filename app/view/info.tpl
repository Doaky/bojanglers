<main class="info-page">
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
		<h2 class="title">Chaplains:</h2>
		<aside class="b-results">
			<div id="content">
			</div>
		</aside>
		<button id="addEntry">ADD ENTRY</button>
	</section>

	<section class="right">
		<h2 class="title">Activity:</h2>
		<aside class="a-results">
			<?php
				$strlist = array();
				foreach($chapactions as $a){
					$actionString='';
					if($a->actionType == '0'){$actionString='was added';}
					if($a->actionType == '1'){$actionString='was edited';}
					if($a->actionType == '2'){$actionString='was removed';}
					if($a->actionType == '3'){$actionString='\'s timeline was added to';}
					if($a->actionType == '4'){$actionString='\'s timeline was edited';}
					if($a->actionType == '5'){$actionString='\'s timeline was removed from';}
					$userString=User::loadById($a->fkUser)->username;
					array_push($strlist, $a->chaplainName . " " . $actionString . " by " . $userString);
				}
				foreach($followactions as $a){
					$actionString='';
					if($a->actionType == '0'){$actionString='started';}
					if($a->actionType == '1'){$actionString='stopped';}
					$followeruser=User::loadById($a->fkFollower)->username;
					$followeduser=User::loadById($a->fkFollowed)->username;
					array_push($strlist, $followeruser . " " . $actionString . " following " . $followeduser);
				}
				foreach($strlist as $s): ?>
					<article class="action">
						<?= $s ?>
					</article>
			<?php endforeach; ?>
		</aside>
	</section>

</main>
