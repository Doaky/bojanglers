<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PandaController and route it
$cc = new ChaplainController();
$cc->route($action);

class ChaplainController {

	// route us to the appropriate class method for this action
	public function route($action) {

		switch($action) {

			case 'chaplain':
				$id = $_GET['id'];
				$this->view($id);
				break;

			case 'index':
				$search = $_GET['search'];
				$this->search($search);
				break;

			case 'addProcess':
				$this->addProcess();
				break;

			case 'edittimeline':
				$save = isset($_POST["save"]);
				if ($save) {
					$this->editTimeline();
				}

				$delete = isset($_POST["delete"]);
				if ($delete) {
					$this->deleteTimeline();
				}
				break;

			case 'editchaplain':
				$save = isset($_POST["save"]);
				if ($save) {
					$this->editChaplain();
				}

				$delete = isset($_POST["delete"]);
				if ($delete) {
					$this->deleteChaplain();
				}
				break;
		}

	}

	public function view($id) {
		// Kept for future implementation of names in title
		// $pageTitle = explode("_", $name);
		// $pageTitle = implode(" ", $pageTitle);
		// $pageTitle = ucwords($pageTitle);

		$pageTitle = "Chaplain";

		include_once SYSTEM_PATH.'/view/header.tpl';

		// Loads in chaplain from id
		$chaplain = Chaplain::loadById($id);
		if ($chaplain != null) {
			// Loads in Chaplain's timeline and documents
			$timelineEntries = TimelineEntry::getByChaplainId($id);
			// $documents = Document::getByChaplainId($id);
			include_once SYSTEM_PATH.'/view/chaplain.tpl';
		}
		else {
			die('Invalid Chaplain');
		}

		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function search($search) {
		$pageTitle = 'Search';

		$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_DATABASE) or die('Error: '.$conn->connect_error);

		// If statements determine if search filter was used, if not display all.
		if ($search != null) {
			$chaplain_query = 'SELECT * FROM chaplains WHERE name LIKE"%'.$search.'%"';
		}
		else {
			$chaplain_query = "SELECT * FROM chaplains";
		}
		$chaplains = $conn->query($chaplain_query);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/search.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addProcess() {
		// get POST variables
		$name       = $_POST['name']; // required
		$faith      = $_POST['faith'];
		$faith_type = $_POST['faith_type']; // required
		$rank       = $_POST['rank'];
		$hometown   = $_POST['hometown'];
		$file       = $_POST['file'];

		// name and faith are required
		if ( !isset($name) || !isset($faith_type) ) {
			header('Location: '.BASE_URL.'/addchaplain/'); exit();
		}

		$chaplain = new Chaplain();

		$chaplain->name       = $name;
		$chaplain->faith      = $faith;
		$chaplain->faith_type = $faith_type;
		$chaplain->rank       = $rank;
		$chaplain->hometown   = $hometown;
		$chaplain->file       = $file;
		$chaplain->creator_id = 1; // hard coded user ID for now

		$chaplainID = $chaplain->save();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

	public function editTimeline() {

		$year        = $_POST['year'];
		$title       = $_POST['title'];
		$description = $_POST['description'];
		$id          = $_POST['id'];
		$chaplainID  = $_POST['chaplainID'];

		$timelineEntry = new TimelineEntry();

		$timelineEntry->year = $year;
		$timelineEntry->title = $title;
		$timelineEntry->description = $description;
		$timelineEntry->chaplain_id = $chaplainID;
		$timelineEntry->creator_id = 1;

		$timelineEntry->id = $id;

		$timelineID = $timelineEntry->save();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

	public function deleteTimeline() {

		$id         = $_POST['id'];
		$chaplainID = $_POST['chaplainID'];

		$timelineEntry = new TimelineEntry();

		$timelineEntry->id = $id;

		$timelineID = $timelineEntry->delete();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

	public function editChaplain() {

		$name       = $_POST['name'];
		$faith      = $_POST['faith'];
		$faith_type = $_POST['faith_type'];
		$rank       = $_POST['rank'];
		$hometown   = $_POST['hometown'];
		$file       = $_POST['file'];
		$id         = $_POST['id'];

		$chaplain = new Chaplain();

		$chaplain->name       = $name;
		$chaplain->faith      = $faith;
		$chaplain->faith_type = $faith_type;
		$chaplain->rank       = $rank;
		$chaplain->hometown   = $hometown;
		$chaplain->file       = $file;
		$chaplain->id         = $id;

		$chaplainID = $chaplain->save();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

	public function deleteChaplain() {

		$id      = $_POST['id'];

		$chaplain = new Chaplain();

		$chaplain->id = $id;

		$chaplainID = $chaplain->delete();

		header('Location: '.BASE_URL.'/search/?search='); exit();
	}

}
