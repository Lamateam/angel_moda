<div id="slideshow<?php echo $module; ?>" class="owl-carousel hidden-xs hidden-sm" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    	<a href="<?php echo $banner['link']; ?>">
				<div class="slider_item"  style="background-image: url(<?php echo $banner['true_image']; ?>)" class="slider_image">
				</div>
			
			</a>
    <?php } else { ?>
    		<div class="slider_item"  style="background-image: url(<?php echo $banner['true_image']; ?>)" class="slider_image">
				</div>
    <?php } ?>
  </div>
  <?php } ?>
</div>

<div class="container">
  <div class="row">
    	<?php $class = 'col-sm-12'; ?>
			<div id="content" class="<?php echo $class; ?>">
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-arrow-left"></i>', '<i class="fa fa-arrow-right"></i>'],
	pagination: true
});
--></script>