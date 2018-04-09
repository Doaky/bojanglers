<main class="home-page">

	<div class="background-image"></div>

	<h1>Login</h1>

	<form method="POST" action="<?= BASE_URL ?>/login/process/">
		<label>Username <input type="text" name="username" value=""></label>
		<br>
		<label>Password <input type="password" name="pw" value=""></label>
		<br>
		<input type="submit" name="submit" value="Login">
	</form>

	<a href="<?= BASE_URL ?>/createaccount/">Create an Account</a>

</main>
