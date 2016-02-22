<?php echo $header; ?>
<?php echo $right_column; ?>


<div class="container normal_page">
  <div class="row">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

    <div id="content" class="col-sm-12">
     <div class="row">
        <div class="col-sm-12">
          <h1><?php echo $heading_title; ?></h1>
          <?php echo $description; ?>
        </div> 
      </div>
    </div>
</div>
<script type="text/javascript">
  $("#menu .nav > li:nth-child(9)").addClass("active"); 
</script>




<?php echo $footer; ?>