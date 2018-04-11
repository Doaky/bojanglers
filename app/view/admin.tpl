<main class = "users">
  <h1>Users</h1>
  <table id = "celebTable">
    <th>User Id</th>
    <th>Username</th>
    <th>User Permissions</th>
    <th>Email</th>
    <?php foreach($users as $entry) {
      if($entry->username != $_SESSION['username']) {
        echo('<tr>');
        echo('<td>'.$entry->id.'</td>');
        echo('<td>'.$entry->username.'</td>');
        if ($entry->permission == 1) {
          echo('<td>Admin</td>');
        }
        else {
          echo('<td>Registered Users</td>');
        }
        echo('<td>'.$entry->email.'</td>');
        echo('<td><button class ="edit-perm">Change Permissions</button></td>');
        echo('<td><button class ="delete-user">Delete User</button></td>');
        echo('<tr>');
      }

    }
  ?>

  </table>
  <br>
  <!-- <?php if(!empty($users)) {
    echo('<button id = "submit-changes">Submit Changes </button>');
  } ?> -->
</main>
