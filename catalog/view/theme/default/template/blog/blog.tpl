<?php echo $header; ?>
<div class="container blog">
  <div class="row">
    <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  </div>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="blog"><?php echo $name; ?></h1>
      <div class="row row_blog">

      <?php if ($articles) { ?>
        <?php foreach ($articles as $article) { ?>


        <div class ="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
          <div class="article_block">
                <span class="date_category"><?php echo $article['date_modified']; ?></span>
                <h2><a href="<?php echo $article['href']; ?>" title="<?php echo $article['name']; ?>"><?php echo $article['name']; ?>  </a></h2>
              
                <div class="article_intro"><?php echo $article['intro_text']; ?></div>
            </div>
        </div>

        <?php } ?>
      </div>  
      <div class="row">
        <div class="col-xs-12 text-left">
            <div class="row">
        <?php echo $pagination; ?>
            </div>
        </div>
       
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>




<?php echo $footer; ?>
