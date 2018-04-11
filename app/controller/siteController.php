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
			case 'createaccount' :
				$this->createaccount();
				break;
			case 'createaccountProcess' :
				$email = $_POST['email'];
				$username = $_POST['username'];
				$password = $_POST['pw'];
				$confirmed = $_POST['pwConfirm'];
				$firstName = $_POST['firstName'];
				$lastName = $_POST['lastName'];
				$education = $_POST['education'];
				if($password != $confirmed) {
					header('Location: '.BASE_URL.'/createaccount'); exit();
				}
				$this->createaccountProcess($email, $username, $password, $firstName, $lastName, $education);
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

			case 'admin':
				$this->admin();
				break;

			case 'info' :
				$this->info();
				break;

			case 'deleteUserProcess' :
				$id = $_POST['id'];
				$this->deleteUserProcess($id);
		}
	}
	public function home() {
		$pageTitle = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function info() {
		$pageTitle = 'Info';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/info.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function admin() {
		if($_SESSION['admin'] != 1) {
			header('Location: '.BASE_URL); exit();
		}
		$pageTitle = 'Admin';
		$users = User::getUsers();
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/admin.tpl';
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
	public function createaccount() {
		$pageTitle = 'Create Account';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/createaccount.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}
	public function createaccountProcess($email, $un, $pw, $fn, $ln, $ed) {
		$user = new User();
		$user->username = $un;
		$user->password = $pw;
		$user->email = $email;
		$user->firstName = $fn;
		$user->lastName = $ln;
		$user->education = $ed;
		$userID = $user->save();
		$this->loginProcess($user->username, $user->password);
	}
	public function loginProcess($un, $pw) {
		// $correctUsername = 'admin';
		// $correctPassword = '123';
		$user = User::login($un, $pw);
		if ($user == NULL) {
			header('Location: '.BASE_URL);
		}
		else {
			$_SESSION['username'] = $user->username;
			$_SESSION['userID'] = $user->id;
			$_SESSION['admin'] = $user->permission;
			// echo($_SESSION['userID']);
			header('Location: '.BASE_URL.'/account'); exit();
		}
	}

	public function deleteUserProcess($id) {
		User::delete($id);
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
