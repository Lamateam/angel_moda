<?php echo $header; ?>

<script src="catalog/view/javascript/jquery/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<link type="text/css" href="catalog/view/javascript/jquery/jquery-ui/jquery-ui.min.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/g/jquery.ui.timepicker.addon@1.4.5(jquery-ui-timepicker-addon.min.css+jquery-ui-timepicker-addon.css)">
<script src="https://cdn.jsdelivr.net/g/jquery.ui.timepicker.addon@1.4.5(jquery-ui-timepicker-addon.min.js+jquery-ui-sliderAccess.js+jquery-ui-timepicker-addon.js)"></script>


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
          <?php echo $description; ?><?php echo $content_bottom; ?></div> 
        </div>
        <div class="col-sm-3">
            <?php echo $column_right; ?>
        </div>
      </div>
    </div>
</div>

<script type="text/javascript">
  $(document).ready(function() {
    if ($("html[lang='en']").length>0) {
       $("#date_start").datepicker({

        changeMonth: false,
        changeYear: false,
        dateFormat: 'dd.mm.yy',
        minDate: 0,
         firstDay: 1  ,
        onSelect: function(dateText) {
                 $("#date_end").datepicker('option', 'minDate', dateText);
         }
    });
    
     $("#date_end").datepicker({
       
        changeMonth: false,
        changeYear: false,
        dateFormat: 'dd.mm.yy',
        minDate: 0,
         firstDay: 1  
    });
      
    }else{
      $("#date_start").datepicker({
        monthNames:
        ["Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август", 
        "Сентябрь","Октябрь","Ноябрь","Декабрь"],
        dayNamesMin: 
        [ "Вс","Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
        changeMonth: false,
        changeYear: false,
        dateFormat: 'dd.mm.yy',
        minDate: 0,
         firstDay: 1,
        onSelect: function(dateText) {
                 $("#date_end").datepicker('option', 'minDate', dateText);
         }
    });
    
     $("#date_end").datepicker({
        monthNames:
        ["Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август", 
        "Сентябрь","Октябрь","Ноябрь","Декабрь"],
        dayNamesMin: 
        ["Вс","Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
        changeMonth: false,
        changeYear: false,
        dateFormat: 'dd.mm.yy',
        minDate: 0,
         firstDay: 1    });
    }
  });


<?php


  if ($_SERVER['REQUEST_URI'] == "/shoptour") {
    ?>
      $("#menu .nav > li:nth-child(8)").addClass("active");
    <?php
  }

  if ($_SERVER['REQUEST_URI'] == "/wholesale") {
    ?>
      $("#menu .nav > li:nth-child(6)").addClass("active");
    <?php
  }





?>
</script>
<?php echo $footer; ?>