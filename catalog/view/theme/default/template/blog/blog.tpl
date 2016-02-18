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
      <h1><?php echo $name; ?></h1>
      <div class="row row_blog">

      <?php if ($articles) { ?>
        <?php foreach ($articles as $article) { ?>


        <div class ="col-lg-4 col-md-4 col-sm-2 col-xs-1 ">
          <div class="article_block">
               <div class="img_block">
                  <a href="<?php echo $article['href']; ?>" title="<?php echo $article['name']; ?>">
                     <img src="http://localhost/image/catalog/1200081396-900x350w.jpg" class="img-responsive">

                  </a>
                </div>
                <h2><a href="<?php echo $article['href']; ?>" title="<?php echo $article['name']; ?>"><?php echo $article['name']; ?>  </a></h2>
                <span class="date_category"><?php echo $article['date_modified']; ?></span>

            </div>
        </div>



          <div class="panel panel-default" style="display: none;">
              <div class="panel-body">
                <div class="article-layout article-list col-xs-12">
                  <div class="article-intro">
                    <div>
                        <h3><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                        <p><?php echo $article['date_modified']; ?></p>
                        <p><?php echo $article['intro_text']; ?></p>
                    </div>
                  </div>
                  <div class="buttons">
                        <div class="pull-right"><a href="<?php echo $article['href']; ?>" class="btn btn-primary"><?php echo $button_read_more; ?></a></div>
                  </div>
                </div>
              </div>
          </div>
        <?php } ?>
      </div>  
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
