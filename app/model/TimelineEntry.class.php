<?php

class TimelineEntry {
	const DB_TABLE = 'timeline_entries'; // database table name

	// database fields for this table
	public $id = 0;
	public $chaplain_id = 0;
	public $title = '';
	public $year = 0;
	public $description = null;
	public $creator_id = 0;
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
		} else {
			$row = $result->fetch_assoc(); // get results as associative array

			$te = new TimelineEntry(); // instantiate new Life Event object

			// store db results in local object
			$te->id           = $row['id'];
			$te->chaplain_id  = $row['chaplain_id'];
			$te->title        = $row['title'];
			$te->year         = $row['year'];
			$te->description  = $row['description'];
			$te->creator_id   = $row['creator_id'];
			$te->date_created = $row['date_created'];

			return $te; // return the life event
		}
	}

	// return all life events attached to a soldier
	public static function getByChaplainId($chaplainID) {
		$db = Db::instance();
		$q = sprintf("SELECT te.id AS TimelineEntryID FROM `%s` te
			INNER JOIN `%s` s ON
			te.chaplain_id = s.id
			WHERE te.chaplain_id = %d
			ORDER BY te.year ASC ",
			self::DB_TABLE,
			Chaplain::DB_TABLE,
			$chaplainID
			);

		$result = $db->query($q);

		$events = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$events[] = self::loadById($row['TimelineEntryID']);
			}
		}
		return $events;
	}

	public function save(){
		if ($this->id == 0) {
			return $this->insert(); // object is new and needs to be created
		}
		else {
			return $this->update(); // object already exists and needs to be updated
		}
	}

	public function insert() {
		if($this->id != 0)
			return null; // can't insert something that already has an ID

		$db = Db::instance(); // connect to db
		// build query
		$q = sprintf("INSERT INTO %s (chaplain_id, title, year, description, creator_id)
		VALUES (%s, %s, %s, %s, %d);",
			self::DB_TABLE,
			$db->escape($this->chaplain_id),
			$db->escape($this->title),
			$db->escape($this->year),
			$db->escape($this->description),
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

		// builds query for edited fields
		if ($this->title != null) {
			$q = sprintf("UPDATE timeline_entries SET
				title = %s
				WHERE id = %s;",
				$db->escape($this->title),
				$db->escape($this->id)
			);

			$db->query($q);
		}

		if ($this->year != null) {
			$q = sprintf("UPDATE timeline_entries SET
				year = %s
				WHERE id = %s;",
				$db->escape($this->year),
				$db->escape($this->id)
			);

			$db->query($q);
		}

		if ($this->description != null) {
			$q = sprintf("UPDATE timeline_entries SET
				description = %s
				WHERE id = %s;",
				$db->escape($this->description),
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
		$q = sprintf("DELETE FROM timeline_entries WHERE id = %s;",
			$db->escape($this->id)
			);

		$db->query($q);
		return 0; // return this object's ID
	}
}
