<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {

		switch($action) {

			case 'home':
				$this->home();
				break;

			case 'account':
				$this->account();
				break;

			case 'login':
				$this->login();
				break;

			case 'loginProcess':
				$username = $_POST['username'];
				$password = $_POST['pw'];
				$this->loginProcess($username, $password);
				break;

			case 'logout':
				$this->logoutProcess();
				break;

			case 'add':
				$this->add();
				break;

			case 'about':
				$this->about();
				break;

			case 'help':
				$this->help();
				break;

			case 'contact':
				$this->contact();
				break;
		}

	}

	public function home() {
		$pageTitle = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function account() {
		// redirect if not logged in
		if (!isset($_SESSION['username'])) {
			header('Location: '.BASE_URL.'/login'); exit();
		}

		$pageTitle = 'Account';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/account.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function loginProcess($un, $pw) {
		// TODO Remove hardcode and make user table in database
		$correctUsername = 'admin';
		$correctPassword = '123';

		if ($un != $correctUsername)
			header('Location: '.BASE_URL);
		elseif ($pw != $correctPassword)
			header('Location: '.BASE_URL);
		else {
			$_SESSION['username'] = $un;
			header('Location: '.BASE_URL.'/account'); exit();
		}
	}

	public function login() {
		$pageTitle = 'Login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function logoutProcess() {
		unset($_SESSION['username']); // not necessary, but just to be safe
		session_destroy();
		header('Location: '.BASE_URL); exit(); // send us to home page
	}

	public function add() {
		$pageTitle = 'Add Chaplain';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/add.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function about() {
		$pageTitle = 'About';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/about.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function help() {
		$pageTitle = 'Help';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/help.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function contact() {
		$pageTitle = 'Contact';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/contact.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

}
