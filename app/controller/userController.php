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
				$this->addFollower();
				break;

			case 'removeFollowing':
				$this->removeFollower();
				break;
		}
	}

	public function view($id) {
		if ($id == $_SESSION['userID']) {
			header('Location: '.BASE_URL.'/account'); exit();
		}

		$pageTitle = "User";

		include_once SYSTEM_PATH.'/view/header.tpl';

		// Loads in profile from id
		$user = User::loadById($id);
		$following = Following::isFollowing($_SESSION['userID'], $id);
		$followers = Following::getUsersFollowing($id);

		$users = User::getUsers();
		$chapactions = ChaplainAction::getbyUserId($id);
		$chaplains = Chaplain::getChaplains();
		$followactions = FollowingAction::getbyFollowingId($id);

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

	public function addFollower() {
		$fkFollower  = $_POST['fkFollower'];
		$fkFollowed  = $_POST['fkFollowed'];

		$following             = new Following();
		$following->fkFollower = $fkFollower;
		$following->fkFollowed = $fkFollowed;
		$following->save();

		$action                = new FollowingAction();
		$action->fkFollower    = $fkFollower;
		$action->fkFollowed    = $fkFollowed;
		$action->actionType    = '0';
		$action->save();

		header('Location: '.BASE_URL.'/user/'.$fkFollowed); exit();
	}

	public function removeFollower() { #id of following relationship

		$fkFollower  = $_POST['fkFollower'];
		$fkFollowed  = $_POST['fkFollowed'];

		$followingID = Following::followingID($fkFollower, $fkFollowed);

		$following = Following::loadById($followingID);

		$action             = new FollowingAction();
		$action->fkFollower = $following->fkFollower;
		$action->fkFollowed = $following->fkFollowed;
		$action->actionType = '1';
		$following->delete();
		$action->save();

		header('Location: '.BASE_URL.'/user/'.$fkFollowed); exit();
	}
}
