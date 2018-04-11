<?php

// Represents a single instance of a user following another
class Following {
	const DB_TABLE = 'following'; // database table name

	// database fields for this table
	public $id = 0;
	public $fkFollowing = 0;
	public $actionType = 0;
	public $timestamp = 0;

	// return a Following object by ID
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

			$f = new Following(); // instantiate new Following

			// store db results in local object
			$f->id           = $row['id'];
			$f->fkFollower  = $row['fkFollower'];
			$f->fkFollowed        = $row['fkFollowed'];
			$f->timestamp         = $row['timestamp'];

			return $f; // return the life event
		}
	}

	// return all people following a person, given that user's ID
	public static function getUsersFollowing($userID) {
		$db = Db::instance();
		$q = sprintf("SELECT * FROM `%s` WHERE `fkFollower` = %d ",
			self::DB_TABLE,
			$userID
			);

		$result = $db->query($q);

		$events = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$events[] = self::loadById($row['fkFollowed']);
			}
		}
		return $events;
	}

	// return all people a user is following, given that user's ID
	public static function getUsersFollowed($userID) {
		$db = Db::instance();
		$q = sprintf("SELECT * FROM `%s` WHERE `fkFollowed` = %d ",
			self::DB_TABLE,
			$userID
			);

		$result = $db->query($q);

		$events = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$events[] = self::loadById($row['fkFollower']);
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
		$q = sprintf("INSERT INTO %s (fkFollower, FkFollowed)
		VALUES (%d, %d);",
			self::DB_TABLE,
			$db->escape($this->fkFollower),
			$db->escape($this->fkFollowed),
			);

		$db->query($q); // execute query
		return $db->getInsertID(); // return last inserted ID
	}

	public function delete() {
		if ($this->id == 0) {
			return null; // can't update something without an ID
		}

		$db = Db::instance(); // connect to db

		// build query
		$q = sprintf("DELETE FROM following WHERE id = %s;",
			$db->escape($this->id)
			);

		$db->query($q);

		return 0; // return this object's ID
	}
}
