<?php

class Panda {
	const DB_TABLE = 'pandas'; // database table name

	// database fields for this table
	public $id = 0;
	public $name = '';
	public $born = null;
	public $died = null;
	public $location = null;
	public $parents = null;
	public $siblings = null;
	public $children = null;
	public $file = null;
	public $creator_id = 0;
	public $date_created = 0;

	// return a Pandas object by ID
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

			$panda = new Panda(); // instantiate new Pandas object

			// store db results in local object
			$panda->id           = $row['id'];
			$panda->name         = $row['name'];
			$panda->born         = $row['born'];
			$panda->died         = $row['died'];
			$panda->location     = $row['location'];
			$panda->parents      = $row['parents'];
			$panda->siblings     = $row['siblings'];
			$panda->children     = $row['children'];
			$panda->file         = $row['file'];
			$panda->creator_id   = $row['creator_id'];
			$panda->date_created = $row['date_created'];

			return $panda; // return the pandas
		}
	}

	// return all Pandas as an array
	public static function getPandas() {
		$db = Db::instance();
		$q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY last_name ASC;";
		$result = $db->query($q);

		$pandas = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$pandas[] = self::loadById($row['id']);
			}
		}
		return $pandas;
	}

	public function save(){
		if($this->id == 0) {
			return $this->insert(); // pandas is new and needs to be created
		} else {
			return $this->update(); // pandas already exists and needs to be updated
		}
	}

	public function insert() {
		if($this->id != 0)
			return null; // can't insert something that already has an ID

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("INSERT INTO %s (name, born, died, location, parents, siblings, children, file, creator_id)
		VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %d);",
			self::DB_TABLE,
			$db->escape($this->name),
			$db->escape($this->born),
			$db->escape($this->died),
			$db->escape($this->location),
			$db->escape($this->parents),
			$db->escape($this->siblings),
			$db->escape($this->children),
			$db->escape($this->file),
			$db->escape($this->creator_id)
			);

		$db->query($q); // execute query
		echo $db->getInsertID();
		return $db->getInsertID(); // return last inserted ID
	}

	public function update() {
		if($this->id == 0)
			return null; // can't update something without an ID

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("UPDATE pandas SET
			name     = %s,
			born     = %s,
			died     = %s,
			location = %s,
			parents  = %s,
			siblings = %s,
			children = %s,
			file     = %s
			WHERE id = %s;",
			$db->escape($this->name),
			$db->escape($this->born),
			$db->escape($this->died),
			$db->escape($this->location),
			$db->escape($this->parents),
			$db->escape($this->siblings),
			$db->escape($this->children),
			$db->escape($this->file),
			$db->escape($this->id)
		);

		$db->query($q);

		return $this->id; // return this object's ID
	}

	public function delete() {
		if($this->id == 0) {
			return null; // can't update something without an ID
		}

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("DELETE FROM pandas WHERE id = %s;",
			$db->escape($this->id)
			);
		
		$db->query($q);
		return 0; // return this object's ID
	}

}
