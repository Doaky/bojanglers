<main class="home-page">

	<div class="background-image"></div>

	<h2>Create Account</h2>

	<form method="POST" action="<?= BASE_URL ?>/createaccount/process/">
		<label>Email <input type="email" name="email" placeholder="Enter Email..."></label> <br>
		<label>Username <input type="text" name="username" required="required" placeholder="Enter Username..."></label> <br>
		<label>First Name <input type="text" name="firstName" placeholder="Enter First Name..."></label> <br>
		<label>Last Name <input type="text" name="lastName" placeholder="Enter Last Name..."></label> <br>
		<label>Education Level
			<select name="education">
				<option disabled selected value>Select an Education Level</option>
				<option value="0">Less than High School</option>
				<option value="1">High School</option>
				<option value="2">Some College</option>
				<option value="3">Bachelors Degree</option>
				<option value="4">Graduate Degree</option>
			</select>
		</label> <br>
		<label>Password <input id="pw" type="password" name="pw" required="required" placeholder="Enter a Password..."></label> <br>
		<label>Confirm Password <input type="password" name="pwConfirm" required="required" placeholder="Confirm Password..." oninput="check(this)"></label> <br>
		<input class="button" type="submit" name="submit" value="Create">
	</form>

</main>

<script language='javascript' type='text/javascript'>
	// https://stackoverflow.com/questions/9142527/can-you-require-two-form-fields-to-match-with-html5
	function check(pwConfirm) {
		if (pwConfirm.value != document.getElementById('pw').value) {
			pwConfirm.setCustomValidity('Password Must be Matching.');
		} else {
			pwConfirm.setCustomValidity('');
		}
	}
</script>
