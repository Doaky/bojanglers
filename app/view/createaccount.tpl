<main class="home-page create-page">

	<div class="background-image"></div>

	<h2>Create Account</h2>

	<form method="POST" action="<?= BASE_URL ?>/createaccount/process/">
		<fieldset>
			<legend>Username</legend>
			<input type="text" name="username" required="required" placeholder="Enter Username...">
		</fieldset>

		<fieldset>
			<legend>Email</legend>
			<input type="email" name="email" required="required" placeholder="Enter Email...">
		</fieldset>

		<fieldset>
			<legend>First Name</legend>
			<input type="text" name="firstName" required="required" placeholder="Enter First Name...">
		</fieldset>

		<fieldset>
			<legend>Last Name</legend>
			<input type="text" name="lastName" required="required" placeholder="Enter Last Name...">
		</fieldset>

		<fieldset>
			<legend>Education Level</legend>
			<select name="education" required="required">
				<option disabled selected value>Select an Education Level</option>
				<option value="0">Less than High School</option>
				<option value="1">High School</option>
				<option value="2">Some College</option>
				<option value="3">Bachelors Degree</option>
				<option value="4">Graduate Degree</option>
			</select>
		</fieldset>

		<fieldset>
			<legend>Password</legend>
			<input id="pw" type="password" name="pw" required="required" placeholder="Enter a Password...">
		</fieldset>

		<fieldset>
			<legend>Confirm Password</legend>
			<input type="password" name="pwConfirm" required="required" placeholder="Confirm Password..." oninput="check(this)">
		</fieldset>
		<br> <br>
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
