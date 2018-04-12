<?php

// Represents a single instance of a user following another
class FollowingAction {
	const DB_TABLE = 'following_actions'; // database table name

	// database fields for this table
	public $id = 0;
	public $fkFollower = 0;
	public $fkFollowed = 0;
	public $actionType = 0;
	public $timestamp = '';

	// return a Following Action object by ID
	public static function loadById($id) {
		$db = Db::instance(); // create db connection
		// build query
		$q = sprintf("SELECT * FROM `%s` WHERE id = %s;",
			self::DB_TABLE,
			$id
			);
		$result = $db->query($q); // execute query
		// make sure we found something
		if($result->num_rows == 0) {
			return null;
		} else {
			$row = $result->fetch_assoc(); // get results as associative array

			$f = new FollowingAction(); // instantiate new FollowingAction

			// store db results in local object
			$f->id           = $row['id'];
			$f->fkFollower  = $row['fkfollower'];
			$f->fkFollowed  = $row['fkfollowed'];
			$f->actionType        = $row['actionType'];
			$f->timestamp         = $row['timestamp'];

			return $f; // return the life event
		}
	}

	// return all following actions associated with the user
	public static function getbyFollowingId($userId) {
		$db = Db::instance();
		$q = sprintf("SELECT * FROM `%s` WHERE `fkFollower` = %s ",
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

	// return all following actions associated with people following the user given
	public static function getUsersFollowed($userID) {
		$db = Db::instance();
		$q = sprintf("SELECT * FROM `%s` WHERE `fkFollowed` = %s ",
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
		$q = sprintf("INSERT INTO %s (fkFollower, fkFollowed, actionType)
		VALUES (%s, %s, %s);",
			self::DB_TABLE,
			$db->escape($this->fkFollower),
			$db->escape($this->fkFollowed),
			$db->escape($this->actionType)
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
		$q = sprintf("DELETE FROM following_actions WHERE id = %s;",
			$db->escape($this->id)
			);

		$db->query($q);
		return 0; // return this object's ID
	}
}
