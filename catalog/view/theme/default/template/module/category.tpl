<div class="list-group">
  <?php foreach ($categories as $category) { ?>
    <?php if ($category['category_id'] == $category_id) { ?>
      <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>

          <?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="list-group-item active"><?php echo $child['name']; ?></a>
          <?php } else { ?>
            <a href="<?php echo $child['href']; ?>" class="list-group-item"><?php echo $child['name']; ?></a>
          <?php } ?>

          <?php if ($child['children']) { ?>
            <?php foreach ($child['children'] as $_child) { ?>
              <?php if ($_child['category_id'] == $child_id) { ?>
                <a href="<?php echo $_child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $_child['name']; ?></a>
              <?php } else { ?>
                <a href="<?php echo $_child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $_child['name']; ?></a>
              <?php } ?>
            <?php } ?>            
          <?php } ?>
        <?php } ?>
      <?php } ?>
    <?php } ?>
  <?php } ?>
</div>
