<main class="home-page">

	<div class="background-image"></div>

	<h1>Create Account</h1>

	<form method="POST" action="<?= BASE_URL ?>/createaccount/process/">
    <label>Email <input type="email" name="email" value=""></label>
		<br>
		<label>Username <input type="text" name="username" value=""></label>
		<br>
    <label>First Name <input type="text" name="firstName" value=""></label>
		<br>
		<label>Last Name <input type="text" name="lastName" value=""></label>
		<br>
    <label>Education Level<select name="education">
        <option disabled selected value>Select an Education Level</option>
        <option value="0">Less than High School</option>
        <option value="1">High School</option>
        <option value="2">Some College</option>
        <option value="3">Bachelors Degree</option>
        <option value="4">Graduate Degree</option>
    </select></label>
		<label>Password <input type="password" name="pw" value=""></label>
		<br>
    <label>Confirm Password <input type="password" name="pwConfirm" value=""></label>
		<br>
		<input type="submit" name="submit" value="create">
	</form>

</main>
