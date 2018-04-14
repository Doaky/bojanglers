<?php

// Represents a single instance of a user following another
class ChaplainAction {
	const DB_TABLE = 'chaplain_actions'; // database table name

	// database fields for this table
	public $id = 0;
	public $fkUser = 0;
	public $actionType = 0;
	public $chaplainName = '';
	public $timestamp = '';

	// return a Chaplain Action object by ID
	public static function loadById($id) {
		$db = Db::instance(); // create db connection
		// build query
		$q = sprintf("SELECT * FROM `%s` WHERE id = %s;",
			self::DB_TABLE,
			$id
			);
		$result = $db->query($q); // execute query
		// make sure we found something
		if ($result->num_rows == 0) {
			return null;
		} else {
			$row = $result->fetch_assoc(); // get results as associative array

			$f = new ChaplainAction(); // instantiate new FollowingAction

			// store db results in local object
			$f->id           = $row['id'];
			$f->fkUser       = $row['fkUser'];
			$f->actionType   = $row['actionType'];
			$f->chaplainName = $row['chaplainName'];
			$f->timestamp    = $row['timestamp'];

			return $f; // return the life event
		}
	}

	// return all actions associated with the user
	public static function getbyUserId($userID) {
		$db = Db::instance();
		$q = sprintf("SELECT * FROM `%s` WHERE `fkUser` = %s ",
			self::DB_TABLE,
			$userID
			);

		$result = $db->query($q);

		$events = array();
		if ($result->num_rows != 0) {
			while ($row = $result->fetch_assoc()) {
				$events[] = self::loadById($row['fkUser']);
			}
		}
		return $events;
	}

	// return all actions as an array
	public static function getActions() {
		$db = Db::instance();
		$q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY id ASC;";
		$result = $db->query($q);
		$actions = array();
		if ($result->num_rows != 0) {
			while ($row = $result->fetch_assoc()) {
				$actions[] = self::loadById($row['id']);
			}
		}
		return $actions;
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
		if ($this->id != 0)
			return null; // can't insert something that already has an ID

		$db = Db::instance(); // connect to db
		// build query
		$q = sprintf("INSERT INTO %s (fkUser, chaplainName, actionType)
		VALUES (%s, %s, %s);",
			self::DB_TABLE,
			$db->escape($this->fkUser),
			$db->escape($this->chaplainName),
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
		$q = sprintf("DELETE FROM chaplain_actions WHERE id = %s;",
			$db->escape($this->id)
			);

		$db->query($q);
		return 0; // return this object's ID
	}
}
