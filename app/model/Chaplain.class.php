<?php

class Chaplain {
	const DB_TABLE = 'chaplains'; // database table name

	// database fields for this table
	public $id           = 0;
	public $name         = '';
	public $faith        = '';
	public $faith_type   = 0;
	public $rank         = null;
	public $hometown     = null;
	public $creator_id   = 0;
	public $date_created = 0;

	// return a Chaplains object by ID
	public static function loadById($id) {
		$db = Db::instance(); // create db connection
		// build query
		$q = sprintf("SELECT * FROM `%s` WHERE id = %d;",
			self::DB_TABLE,
			$id
			);
		$result = $db->query($q); // execute query
		// make sure we found something
		if ($result->num_rows == 0) {
			return null;
		}
		else {
			$row = $result->fetch_assoc(); // get results as associative array

			$chaplain = new Chaplain(); // instantiate new Chaplains object

			// store db results in local object
			$chaplain->id           = $row['id'];
			$chaplain->name         = $row['name'];
			$chaplain->faith        = $row['faith'];
			$chaplain->faith_type   = $row['faith_type'];
			$chaplain->rank         = $row['rank'];
			$chaplain->hometown     = $row['hometown'];
			$chaplain->creator_id   = $row['creator_id'];
			$chaplain->date_created = $row['date_created'];

			return $chaplain; // return the chaplains
		}
	}

	// return all Chaplains as an array
	public static function getChaplains() {
		$db = Db::instance();
		$q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY name ASC;";
		$result = $db->query($q);

		$chaplains = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$chaplains[] = self::loadById($row['id']);
			}
		}
		return $chaplains;
	}

	public function save(){
		if($this->id == 0) {
			return $this->insert(); // chaplains is new and needs to be created
		} else {
			return $this->update(); // chaplains already exists and needs to be updated
		}
	}

	public function insert() {
		if($this->id != 0)
			return null; // can't insert something that already has an ID

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("INSERT INTO chaplains (name, faith, faith_type, rank, hometown, creator_id)
		VALUES (%s, %s, %s, %s, %s, %d);",
			$db->escape($this->name),
			$db->escape($this->faith),
			$db->escape($this->faith_type),
			$db->escape($this->rank),
			$db->escape($this->hometown),
			$db->escape($this->creator_id)
			);

			$db->query($q); // execute query

		// echo $db->getInsertID();
		return $db->getInsertID(); // return last inserted ID
	}

	public function update() {
		if($this->id == 0)
			return null; // can't update something without an ID

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("UPDATE chaplains SET
			name       = %s,
			faith      = %s,
			faith_type = %s,
			rank       = %s,
			hometown   = %s
			WHERE id   = %s;",
			$db->escape($this->name),
			$db->escape($this->faith),
			$db->escape($this->faith_type),
			$db->escape($this->rank),
			$db->escape($this->hometown),
			$db->escape($this->id)
		);

		$db->query($q);
		echo($q);
		return $this->id; // return this object's ID
	}

	public function delete() {
		if($this->id == 0) {
			return null; // can't update something without an ID
		}

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("DELETE FROM chaplains WHERE id = %s;",
			$db->escape($this->id)
			);

		$db->query($q);
		return 0; // return this object's ID
	}

}
