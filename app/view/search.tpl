<main class="search-page">
	
	<div class="search">
		<input type="search" name="search" placeholder="Search..." id = "searchbox">
		<button  class="button" type="search" id="searchbtn">Search</button>
	</div>

	<section class="middle">
		<h3 class="labels">Chaplains:</h3>
		<aside class="results">
			<aside id="search-chaplains">
				<hr>
				<?php while($row = $chaplains->fetch_assoc()): ?>
					<article class="search-result">
						<h3><a href="<?= BASE_URL ?>/chaplain/<?= $row['id'] ?>"><?= $row['name'] ?></a></h3>
						<h5>
							<?php if($row['faith_type'] == 0): ?>
								Jewish
							<?php elseif($row['faith_type'] == 1): ?>
								Catholic - <?= $row['faith'] ?>
							<?php elseif($row['faith_type'] == 2): ?>
								Protestant
							<?php endif; ?>
						</h5>
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
			</aside>
		</aside>
	</section>

</main>
