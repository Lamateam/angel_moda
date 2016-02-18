<?php echo $header; ?>
<?php echo $right_column; ?>
<div class="container normal_page">
  <div class="row">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
     <div class="row">
        <div class="col-sm-9">
          <h1><?php echo $heading_title; ?></h1>
          <?php echo $description; ?>
        </div>
        <div class="col-sm-3">
          <?php echo $column_right; ?>
        </div>
      </div> 
    </div> 
  </div>
       
    </div>
</div>

<script type="text/javascript">
  $("#menu .nav > li.i-lab").addClass("active"); 
</script>
<?php echo $content_bottom; ?>

<?php echo $form; ?>
<?php echo $footer; ?>