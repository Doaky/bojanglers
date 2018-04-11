<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PandaController and route it
$uc = new UserController();
$uc->route($action);

class UserController {

	// route us to the appropriate class method for this action
	// TODO move other user actions here
	public function route($action) {

		switch($action) {

			case 'user':
				$id = $_GET['id'];
				$this->view($id);
				break;

			case 'editaccount':
				$save = isset($_POST["save"]);
				if ($save) {
					$this->editAccount();
				}
				break;

			case 'addFollower':
				$id = $_GET['id'];
				$followed = $_GET['followed'];
				$this->view($id, $followed);
				break;

			case 'removeFollowing':
				$id = $_GET['id'];
				$this->view($id);
				break;
		}
	}

	public function view($id) {
		$pageTitle = "User";

		include_once SYSTEM_PATH.'/view/header.tpl';

		// Loads in profile from id
		$user = User::loadById($id);
		if ($user != null) {
			include_once SYSTEM_PATH.'/view/user.tpl';
		}
		else {
			die('Invalid User');
		}

		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function editAccount() {

		$username  = $_POST['username'];
		$password  = $_POST['password'];
		$email     = $_POST['email'];
		$firstName = $_POST['firstName'];
		$lastName  = $_POST['lastName'];
		$education = $_POST['education'];
		$id        = $_POST['id'];

		$user = new User();

		$user->username  = $username;
		$user->password  = $password;
		$user->email     = $email;
		$user->firstName = $firstName;
		$user->lastName  = $lastName;
		$user->education = $education;
		$user->id        = $id;

		$userID = $user->save();

		header('Location: '.BASE_URL.'/account/'); exit();
	}

	public function addFollower($id, $follower) {
		$following = new Following();
		$following->fkFollower = $id;
		$following->fkFollowed = $follower;
		$following->save();
		$action = new FollowingAction();
		$action->fkFollower = $id;
		$action->fkFollowed = $follower;
		$action->actionType = 0;
		$action->save();
	}

	public function removeFollower($id) { #id of following relationship
		$following = Following.loadById($id);
		$action = new FollowingAction();
		$action->fkFollower = $following->fkFollower;
		$action->fkFollowed = $following->fkFollowed;
		$action->actionType = 1;
		$following->delete();
		$action->save();
	}


}
