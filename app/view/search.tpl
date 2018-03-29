<main class="search-page">

	<input type="search" name="search" placeholder="Search..." id = "searchbox">
	<button type="button" id="searchbtn">search</button>

	<section class="middle">
		<h3 class="labels">Chaplains:</h3>
		<aside class="results">
			<aside id="search-pandas">
				<hr>
				<?php while($row = $chaplains->fetch_assoc()): ?>
					<article class="search-result">
						<h3><a href="<?= BASE_URL ?>/chaplain/<?= $row['id'] ?>"><?= $row['name'] ?></a></h3>
						<h5><?= $row['faith'] ?></h5>
						<!-- <?php if($row['died'] != ''): ?>
							<h5><?= $row['born'] ?> - <?= $row['died'] ?></h5>
						<?php else: ?>
							<h5><?= $row['born'] ?> - Present</h5>
						<?php endif; ?> -->
						<hr>
					</article>
				<?php endwhile; ?>
			</aside>
		</aside>
	</section>

	<section class="right">
		<h3 class="labels">Documents:</h3>
		<aside class="results">
			<aside id="search-documents">
				<hr>
				<!-- <?php while($row = $documents->fetch_assoc()): ?>
					<?php
						$date = strtotime($row['date']);
						$formated_date = date ("F Y", $date);
					?>
					<article class="search-result">
						<h3><a href="<?= BASE_URL ?>/public/img/pandas/<?= $row['file'] ?>"><?= $row['title'] ?></a></h3>
						<h5><?= $row['location'] ?></h5>
						<h5><?= $formated_date ?></h5>
						<hr>
					</article>
				<?php endwhile; ?> -->
			</aside>
		</aside>
	</section>

</main>
