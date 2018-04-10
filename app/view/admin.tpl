<table id = "celebTable">
  <?php foreach($users as $entry) {
    echo('<tr>');
    echo('<td>'.$entry->username.'</td>');
    echo('<td>'.$entry->email.'</td>');
    echo('<td>'.$entry->admin.'</td>');
    echo('<td>'.$entry->email.'</td>');
    echo('<tr>');
  }
</table>
