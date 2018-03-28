<?php

class Document {
	const DB_TABLE = 'documents'; // database table name

	// database fields for this table
	public $id           = 0;
	public $title        = '';
	public $location     = '';
	public $date         = 0;
	public $file         = null;
	public $panda_id     = 0;
	public $creator_id   = 0;
	public $date_created = 0;

	// return a Life Event object by ID
	public static function loadById($id) {
		$db = Db::instance(); // create db connection

		// build query
		$q = sprintf("SELECT * FROM `%s` WHERE id = %d;",
			self::DB_TABLE,
			$id
			);
		$result = $db->query($q); // execute query
		// make sure we found something
		if($result->num_rows == 0) {
			return null;
		}
		else {
			$row = $result->fetch_assoc(); // get results as associative array

			$d = new Document(); // instantiate new Life Event object

			// store db results in local object
			$d->id           = $row['id'];
			$d->title        = $row['title'];
			$d->location     = $row['location'];
			$d->date         = $row['date'];
			$d->file         = $row['file'];
			$d->panda_id     = $row['panda_id'];
			$d->creator_id   = $row['creator_id'];
			$d->date_created = $row['date_created'];

			return $d; // return the life event
		}
	}

	// return all documents attached to a panda
	public static function getByPandaId($pandaID) {
		$db = Db::instance();
		$q = sprintf("SELECT d.id AS DocumentID FROM `%s` d
			INNER JOIN `%s` s ON
			d.panda_id = s.id
			WHERE d.panda_id = %d
			ORDER BY d.date ASC ",
			self::DB_TABLE,
			Panda::DB_TABLE,
			$pandaID
		);

		$result = $db->query($q);

		$events = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$events[] = self::loadById($row['DocumentID']);
			}
		}
		return $events;
	}

	public function save(){
		if($this->id == 0) {
		  return $this->insert(); // object is new and needs to be created
		} else {
		  return $this->update(); // object already exists and needs to be updated
		}
	}

	public function insert() {
		if ($this->id != 0)
		  return null; // can't insert something that already has an ID

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("INSERT INTO %s (title, location, date, file, panda_id, creator_id)
			VALUES (%s, %s, %s, %s, %s, %d);",
			self::DB_TABLE,
			$db->escape($this->title),
			$db->escape($this->location),
			$db->escape($this->date),
			$db->escape($this->file),
			$db->escape($this->panda_id),
			$db->escape($this->creator_id)
			);

		$db->query($q); // execute query
		return $db->getInsertID(); // return last inserted ID
	}

	public function update() {
		if($this->id == 0) {
			return null; // can't update something without an ID
		}

		$db = Db::instance(); // connect to db

		// Builds a query for each edited field only
		if ($this->title != null) {
			$q = sprintf("UPDATE documents SET
				title = %s
				WHERE id = %s;",
				$db->escape($this->title),
				$db->escape($this->id)
			);

			$db->query($q);
		}

		if ($this->location != null) {
			$q = sprintf("UPDATE documents SET
				location = %s
				WHERE id = %s;",
				$db->escape($this->location),
				$db->escape($this->id)
			);

			echo $this->id;

			$db->query($q);
		}

		if ($this->date != null) {
			$q = sprintf("UPDATE documents SET
				date = %s
				WHERE id = %s;",
				$db->escape($this->date),
				$db->escape($this->id)
			);

			$db->query($q);
		}

		if ($this->file != null) {
			$q = sprintf("UPDATE documents SET
				file = %s
				WHERE id = %s;",
				$db->escape($this->file),
				$db->escape($this->id)
			);

			$db->query($q);
		}

		return 0; // return this object's ID
	}

	public function delete() {
		if ($this->id == 0) {
			return null; // can't update something without an ID
		}

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("DELETE FROM documents WHERE id = %s;",
			$db->escape($this->id)
			);
		echo $q;
		$db->query($q);
		return 0; // return this object's ID
	}

}
