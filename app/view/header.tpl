<!DOCTYPE html>
<html lang="en">
<head>
  <title><?= $pageTitle ?> | Chaplain Stories</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">

  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/styles.css" />
  <link rel="icon" href="<?= BASE_URL ?>/public/img/logo.png">
  <script src="<?= BASE_URL ?>/public/js/jquery-3.1.1.min.js"></script>
  <script src="<?= BASE_URL ?>/public/js/index.js"></script>
</head>

<body>
  <nav>
    <ul class="nav-menu-list">
      <?php if($pageTitle == 'Home'): ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>" class="selected">Home</a></li>
      <?php else: ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>">Home</a></li>
      <?php endif; ?>

      <?php if(isset($_SESSION['username'])): ?>
        <?php if($pageTitle == 'Add Chaplain'): ?>
          <li class="nav-item"><a href="<?= BASE_URL ?>/addchaplain/" class="selected">Add Chaplain</a></li>
        <?php else: ?>
          <li class="nav-item"><a href="<?= BASE_URL ?>/addchaplain/">Add Chaplain</a></li>
        <?php endif; ?>
      <?php endif; ?>

      <?php if($pageTitle == 'Account'): ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>/account/" class="selected">Account</a></li>
      <?php else: ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>/account/">Account</a></li>
      <?php endif; ?>

      <?php if($pageTitle == 'Search'): ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>/search/?search=" class="selected">Search</a></li>
      <?php else: ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>/search/?search=">Search</a></li>
      <?php endif; ?>

      <?php if($pageTitle == 'Info'): ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>/info/" class="selected">Info</a></li>
      <?php else: ?>
        <li class="nav-item"><a href="<?= BASE_URL ?>/info/">Info</a></li>
      <?php endif; ?>

      <?php if(isset($_SESSION['admin'])): ?>
        <?php if($_SESSION['admin'] == 1): ?>
        <?php if($pageTitle == 'Admin'): ?>
          <li class="nav-item"><a href="<?= BASE_URL ?>/admin/" class="selected">Admin</a></li>
        <?php else: ?>
          <li class="nav-item"><a href="<?= BASE_URL ?>/admin/">Admin</a></li>
        <?php endif; ?>
        <?php endif; ?>
      <?php endif; ?>


    </ul>

    <?php if(isset($_SESSION['username'])): ?>
      <section class="status logged-in">
        <h4 class="logged-in">Hello, <i class="username"><?= $_SESSION['username'] ?></i>.</h4>
        <a id="log-out" href="<?= BASE_URL ?>/logout/">Sign Out</a>
      </section>
    <?php else: ?>
      <section class="status logged-out">
        <h4><a id="log-in" href="<?= BASE_URL ?>/login/">Sign In</a></h4>
      </section>
    <?php endif; ?>

  </nav>
