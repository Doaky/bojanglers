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

		<div id="canvas-holder" style="width: 310px;">
			<canvas id="myChart" width="300" height="300" />
		</div>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<script type="text/javascript">
	var jewish     = "<?php echo sizeof($jewish); ?>";
	var catholic   = "<?php echo sizeof($catholic); ?>";
	var protestant = "<?php echo sizeof($protestant); ?>";

	var data = [jewish, catholic, protestant];

	var ctx = document.getElementById('myChart').getContext('2d');
	var myBarChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			datasets: [{
				data: data,
				backgroundColor: [
					'rgb(255, 99, 132)',
					'rgb(75, 192, 192)',
					'rgb(54, 162, 235)'
				],
			}],
			labels: [
				"Jewish: " + jewish,
				"Catholic: " + catholic,
				"Protestant: " + protestant
			]
		},
		options: {
			responsive: true,
			legend: {
				display: true,
				fullWidth: false,
				labels: {
					boxWidth: 20,
					fontSize: 11,
					fontColor: '#fff'
				}
			},
			title: {
				display: true,
				text: 'Chaplains by Faith',
				fontSize: 16,
				fontColor: '#fff'
			}
		}
	});
</script>
