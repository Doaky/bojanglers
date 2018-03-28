<main class="search-page">

	<form class="search" action="<?= BASE_URL ?>/search" method="get">
		<input type="search" name="search" placeholder="Search..." value="<?= $search ?>">
		<input class="button" type="submit" value="Search">
	</form>

	<section class="middle">
		<h3 class="labels">Pandas:</h3>
		<aside class="results">
			<aside id="search-pandas">
				<hr>
				<!-- <?php while($row = $pandas->fetch_assoc()): ?>
					<article class="search-result">
						<h3><a href="<?= BASE_URL ?>/panda/<?= $row['id'] ?>"><?= $row['name'] ?></a></h3>
						<h5><?= $row['location'] ?></h5>
						<?php if($row['died'] != ''): ?>
							<h5><?= $row['born'] ?> - <?= $row['died'] ?></h5>
						<?php else: ?>
							<h5><?= $row['born'] ?> - Present</h5>
						<?php endif; ?>
						<hr>
					</article>
				<?php endwhile; ?> -->
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
