<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href='https://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic,700italic&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>


<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/javascript/masked.js" type="text/javascript"></script>
<script src="catalog/view/javascript/sweetalert.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/default/stylesheet/sweetalert.css" rel="stylesheet" />

<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />


<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<link rel="apple-touch-icon" sizes="57x57" href="/image/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/image/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/image/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/image/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/image/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/image/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/image/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/image/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/image/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="/image/favicon-32x32.png" sizes="32x32">

<link rel="icon" type="image/png" href="/image/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="/image/favicon-16x16.png" sizes="16x16">
<link rel="icon" type="image/png" href="/image/favicon-194x194.png" sizes="194x194">
<link rel="icon" type="image/png" href="/image/android-chrome-192x192.png" sizes="192x192">
<link rel="shortcut icon" href="/image/favicon.ico">
<link rel="manifest" href="/image/manifest.json">
<link rel="mask-icon" href="/image/safari-pinned-tab.svg" color="#df2727">

<meta name="msapplication-TileColor" content="#da532c">
<meta name="msapplication-TileImage" content="/image/mstile-144x144.png">
<meta name="msapplication-config" content="/image/browserconfig.xml">
<meta name="theme-color" content="#f7f7f7">


<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
<link rel="apple-touch-icon" sizes="57x57" href="/image/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="72x72" href="/image/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76" href="/image/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/image/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="/image/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/image/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/image/apple-touch-icon-152x152.png" />
<link rel="apple-touch-icon" sizes="180x180" href="/image/apple-touch-icon-180x180.png" />


</head>
<body class="<?php echo $class; ?> <?php echo $config_language;?> ">



<div class="header_top">
   <div class="container">
   <div class="row">
       <?php if ($logged) { ?>     
          <a href="<?php echo $wishlist; ?>" id="wishlist-total" class="topped_links hidden-xs" title="Wishlist">
       
       <?php }else {?>
          <span href="#enter_form" role="button"  data-toggle="modal"  id="wishlist-total" class="topped_links hidden-xs" title="Wishlist">
       
       <?php }?>
   
       
       <i class="fa fa-heart hidden-xs">
       </i> <span class=""><span class="underlined">Wishlist</span> <span class="text_red">(<?php echo $total_wishlist; ?>)</span>
       </span>
        <?php if ($logged) { ?>    
            </a>
         <?php }else {?> 
          </span>
          <?php }?>
       </span>
       
       
       <a href="/contacts" class="topped_links hidden-xs" title="<?php  echo $text_send; ?>">
       <i class="fa fa-envelope hidden-xs"></i> <span class="">
           <span class="underlined"><?php echo $text_send; ?></span> 
           
           </span>
       </span></a> 
       <div class="lang_select">
       
            <span class="currency-ru currency">
                 <i class="fa-rub fa"></i>
            </span>
             <span class="currency-en currency">
                <i class="fa-dollar fa"></i>
            </span>
         
            <?php echo $language; ?>
       </div>
       <span class="enter_block"> 
             <?php if ($logged) { ?>             
                <ul class="list-inline">
                  <li class="dropdown">
                  <span href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-user"></i> <span class=""><?php echo $text_account; ?></span> 
                  <span class="caret"></span></span>
                    <ul class="dropdown-menu dropdown-menu-right">
             
 
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                    <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                    
                    <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                    </ul>
                   </li>
                   </ul>
                  <?php } else { ?>
                   <span class="enter" href="#enter_form" role="button"  data-toggle="modal"><?php  echo $text_login;?></span>
                      /
                   <span class="register" href="#reg_form" role="button"  data-toggle="modal"><?php echo $text_register;?></span>
               <?php } ?>

       </span>
      
       
       
   </div>
   </div>
</div>
 
<header>
   <div class="container">
      <div class="row">
        <div class="col15-md-3 col-sm-4 col-xs-12 hidden-xs text-center-xs">
            <div class="phone_wrapper">
                  <span class="header_city ">
                      <?php echo $text_moscow;?>
                  </span>
            
            
                <a class="phone" href="tel:<?php echo $telephone; ?>" title="<?php echo $text_moscow;?>">
                    <?php echo $telephone; ?>
                </a> 
           
          </div>
            <span href="#basicModal"  role="button"  data-toggle="modal" class=" order_back"><?php if ($config_language=='ru') { echo 'Заказать обратный звонок';} else { echo 'Request  call back';  }?>   
          </span>
        </div>
         <div class="col15-md-3 col-xs-12 hidden-xs hidden-sm">
            <div class="phone_wrapper">
               <span class="header_city">
                      <?php echo $text_rostow;?>
                  </span>
                 <a href="tel:<?php echo $telephone_rostov; ?>" title=" <?php echo $text_rostow;?>">
                    <?php echo $telephone_rostov; ?>
                </a> 

          </div>
        </div>
         <div class="col15-md-3 col-xs-6 col-sm-4 text-center logo_block">
           
        
            <a href="<?php echo $home; ?>"><img src="/image/logo.svg"  title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
         
        </div>
        <div class="col15-md-5 col-xs-6 col-sm-4  pull-right">
            <?php echo $cart; ?>
        </div>
        
       </div>
   </div>
</header>

<?php if ($categories) { ?>

  <nav id="menu" class="navbar">
  <div class="container">
     <div class="row">
    <div class="navbar-header"><span id="category" class="navbar_span"  data-toggle="collapse" data-target=".navbar-ex1-collapse"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse" aria-expanded="false">
    
    <div class="hidden-lg hidden-md"><?php echo $search; ?></div>
    
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
          <?php if ($category['children']) { ?>
            <?php $top_children = array(); ?>
            <?php $low_children = array(); ?>
            <?php foreach ($category['children'] as $child) { ?>
              <?php if ($child['is_topsub']) { $top_children[] = $child; } else { $low_children[] = $child; } ?>
            <?php } ?>
            <li class="dropdown<?php if(strpos($category['href'], ' i-lab')) {echo 'i-lab' ;} ?>">

              <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
           
                <div class="dropdown-menu">
                <div class="dropdown-inner">
               

                <?php if (count($top_children)>0) { ?>
                   <ul class="list-unstyled main_list">
                    <?php foreach ($top_children as $child) { ?>
                      <li><a href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                <?php } ?>
                 
                  <?php foreach (array_chunk($low_children, ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <ul class="list-unstyled normal_list">
                      <?php foreach ($children as $child) { ?>
                      
                         <?php if ($child['children']) { ?>
                             <li><a href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>" class="header_top_link"><?php echo $child['name']; ?></a></li>
                         <?php }else{ ?>
                             <li><a href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>"><?php echo $child['name']; ?></a></li>
                         <?php } ?>

                        
                        <?php if ($child['children']) { ?>
                          <ul class="list-unstyled full_width">
                           <?php $count = 0;?>
                            <li>

                            <?php foreach ($child['children'] as $_child) { ?>                            
                             <a href="<?php echo $_child['href']; ?>" title="<?php echo $_child['name']; ?>" ><?php echo $_child['name']; ?></a>
                            <?php } ?>
   
                            </li>
                          </ul>
                        <?php } ?>
                      <?php } ?>
                    </ul>
                  <?php } ?>
                </div>
            </li>
          <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
          <?php } ?>
        <?php } ?>
        <li><a href="/manufacturers" title="<?php echo $header_manufacturers;?>"><?php echo $header_manufacturers;?></a></li>
        <li><a href="/wholesale" title="<?php echo $header_wholesailors;?>"><?php echo $header_wholesailors;?></a></li>
        <li class="i-lab"><a href="/i-lab" title="I-LAB">I-LAB</a></li>
        <li><a href="/shoptour" title="<?php echo $header_shop;?>"><?php echo $header_shop;?>
        <li><a href="/contacts" title="<?php echo $header_contacts;?>"><?php echo $header_contacts;?></a></li>  
          
      </ul>
       <div class="hidden-sm hidden-xs"><?php echo $search; ?></div>
    </div>
    </div>
    </div>
  </nav>

<?php } ?>
