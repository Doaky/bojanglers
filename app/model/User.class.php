<?php
class User {
	const DB_TABLE = 'users'; // database table name
	// database fields for this table
	public $id           = 0;
	public $username         = '';
	public $password        = '';
	public $email   = '';
	public $date_created = 0;
  public $firstName = '';
  public $lastName = '';
  public $permission = 0;
  public $education = NULL;

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
			$user = new user(); // instantiate new Chaplains object
			// store db results in local object
			$user->id            = $row['id'];
			$user->username         = $row['username'];
			$user->password        = $row['password'];
			$user->email           = $row['email'];
			$user->date_created = $row['date_created'];
      $user->firstName = $row['firstName'];
      $user->lastName = $row['lastName'];
      $user->permission = $row['permission'];
      $user->education = $row['education'];

			return $user; // return the chaplains
		}
	}
  public static function login($un, $pw) {
    $db = Db::instance(); // create db connection
		// build query
		$q = sprintf("SELECT * FROM `%s` WHERE username = '%s' AND password = '%s';",
			self::DB_TABLE,
			$un,
      $pw
			);
		$result = $db->query($q); // execute query
    echo($q);
		// make sure we found something
		if ($result->num_rows == 0) {
			return null;
		}
    else {
      $row = $result->fetch_assoc(); // get results as associative array
			$user = new user(); // instantiate new Chaplains object
			// store db results in local object
			$user->id            = $row['id'];
			$user->username         = $row['username'];
			$user->password        = $row['password'];
			$user->email           = $row['email'];
			$user->date_created = $row['date_created'];
      $user->firstName = $row['firstName'];
      $user->lastName = $row['lastName'];
      $user->permission = $row['permission'];
      $user->education = $row['education'];
			return $user; // return the chaplains
    }
  }
	// return all Chaplains as an array
	public static function getUsers() {
		$db = Db::instance();
		$q = "SELECT id FROM `".self::DB_TABLE."` ORDER BY id ASC;";
		$result = $db->query($q);
		$users = array();
		if($result->num_rows != 0) {
			while($row = $result->fetch_assoc()) {
				$users[] = self::loadById($row['id']);
			}
		}
		return $users;
	}
	public function save(){
		return $this->insert(); // user is new and needs to be created
	}
	public function insert() {
		if($this->id != 0)
			return null; // can't insert something that already has an ID
		$db = Db::instance(); // connect to db
		// build query
		$q = sprintf("INSERT INTO %s (username, password, email, firstName, lastName, education)
		VALUES (%s, %s, %s, %s, %s, %d);",
			self::DB_TABLE,
			$db->escape($this->username),
			$db->escape($this->password),
			$db->escape($this->email),
      $db->escape($this->firstName),
			$db->escape($this->lastName),
			$db->escape($this->education)

			);
		$db->query($q); // execute query
		// echo $db->getInsertID();
		return $db->getInsertID(); // return last inserted ID
	}
	public function delete() {
		if($this->id == 0) {
			return null; // can't update something without an ID
		}
		$db = Db::instance(); // connect to db
		// build query
		$q = sprintf("DELETE FROM users WHERE id = %s;",
			$db->escape($this->id)
			);
		$db->query($q);
		return 0; // return this object's ID
	}
}
