

<div id="carousel<?php echo $module; ?>" class="owl-carousel col-sm-10 col-sm-offset-1">
  <?php foreach ($banners as $banner) { ?>
		<div class="item text-center">
			<?php if ($banner['link']) { ?>
				<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
			<?php } else { ?>
				<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
			<?php } ?>
		</div>
  <?php } ?>
</div>




<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	slideSpeed: 300,
	navigation: true,
	navigationText: ['<i class="fa fa-arrow-left"></i>', '<i class="fa fa-arrow-right"></i>'],
	pagination: true
});
--></script>