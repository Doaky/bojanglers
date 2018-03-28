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

			case 'editdocument':
				$save = isset($_POST["save"]);
				if ($save) {
					$this->editDocument();
				}

				$delete = isset($_POST["delete"]);
				if ($delete) {
					$this->deleteDocument();
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
			$documents = Document::getByChaplainId($id);
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

		if ($search != null) {
			$document_query = 'SELECT * FROM documents WHERE title LIKE"%'.$search.'%"';
		}
		else {
			$document_query = "SELECT * FROM documents";
		}
		$documents = $conn->query($document_query);

		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/search.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	public function addProcess() {
		// get POST variables
		$name 	     = $_POST['name']; // required
		$born 	     = $_POST['born']; // required
		$died 		 = $_POST['died'];
		$location    = $_POST['location'];
		$parents 	 = $_POST['parents'];
		$siblings    = $_POST['siblings'];
		$children 	 = $_POST['children'];
		$file        = $_POST['file'];

		// name and born are required
		if ( empty($name) || empty($born) ) {
			header('Location: '.BASE_URL.'/soldier/add/'); exit();
		}

		$chaplain = new Chaplain();

		$chaplain->name       = $name;
		$chaplain->born       = $born;
		$chaplain->died       = $died;
		$chaplain->location   = $location;
		$chaplain->parents    = $parents;
		$chaplain->siblings   = $siblings;
		$chaplain->children   = $children;
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
		$chaplainID     = $_POST['chaplainID'];

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

		$id      = $_POST['id'];
		$chaplainID = $_POST['chaplainID'];

		$timelineEntry = new TimelineEntry();

		$timelineEntry->id = $id;

		$timelineID = $timelineEntry->delete();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

	public function editChaplain() {

		$name     = $_POST['name'];
		$born     = $_POST['born'];
		$died     = $_POST['died'];
		$location = $_POST['location'];
		$parents  = $_POST['parents'];
		$siblings = $_POST['siblings'];
		$children = $_POST['children'];
		$file     = $_POST['file'];
		$id       = $_POST['id'];

		$chaplain = new Chaplain();

		$chaplain->name     = $name    ;
		$chaplain->born     = $born    ;
		$chaplain->died     = $died    ;
		$chaplain->location = $location;
		$chaplain->parents  = $parents ;
		$chaplain->siblings = $siblings;
		$chaplain->children = $children;
		$chaplain->file     = $file    ;
		$chaplain->id       = $id      ;

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

	public function editDocument() {

		$title    = $_POST['title'];
		$location = $_POST['location'];
		$date     = $_POST['date'];
		$file     = $_POST['file'];
		$chaplainID  = $_POST['chaplainID'];
		$id       = $_POST['id'];

		$document = new Document();

		$document->title       = $title;
		$document->location    = $location;
		$document->date        = $date;
		$document->file        = $file;
		$document->chaplain_id = $chaplainID;
		$document->creator_id  = 1;
		$document->id          = $id;

		$documentID = $document->save();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

	public function deleteDocument() {

		$id      = $_POST['id'];
		$chaplainID = $_POST['chaplainID'];

		$document = new Document();

		$document->id = $id;

		$documentID = $document->delete();

		header('Location: '.BASE_URL.'/chaplain/'.$chaplainID); exit();
	}

}
