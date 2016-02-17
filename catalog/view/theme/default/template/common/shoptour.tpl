<section class="raitings">
		<div class="container raitings_cont">
		
			<div class="tuf hidden-xs hidden-sm">
			</div>
			<div class="bag hidden-xs hidden-sm">
			</div>
			<div class="ring hidden-xs hidden-sm">
			</div>
		
				<div class="col-md-7 background_white">
					<h2>
							<?php if ($config_language=='ru') {?>
										Общая оценка вашего имиджа с 
							<?php }else{ ?>
										Overall assessment of your image with
							<?php } ?>
							<br>
							<span class="smaller">
									<?php if ($config_language=='ru') {?>
												персональным подбором гардероба 
									<?php }else{ ?>
												 a personal selection of wardrobe
									<?php } ?>
							</span>
					</h2>
					<p>
								<?php if ($config_language=='ru') {?>
										Вы готовы к ярким и стильным переменам? И хотите бесплатно получить персональную консультацию профессионального стилиста по выбору гардероба? Тогда загрузите свою фотографию в полный рост в любимой одежде, укажите имя и телефон – и в течение 24 часов Вам на почту придет письмо с описанием Вашего психотипа и рекомендациями стилиста по развитию и улучшению своего доминирующего стиля. Наши имиджмейкеры откроют Вам секреты формирования стильного образа, исходя из Ваших индивидуальных особенностей. В письме Вам будет предложена индивидуальная подборка из нескольких стильных луков, а также даны ценные рекомендации по выбору тканей, фасонов и аксессуаров. В качестве дополнительного бонуса Вы получите советы по созданию идеального макияжа и прически согласно Вашему психотипу.
								<?php } else { ?>
										My kiddos pretty much live in them right now. They are all about comfort and love wearing athletic pants/shorts paired with a sporty t-shirt. I need to stock up on more for this summer. I like to have a good mix of t-shirts and sleeveless tees for my boys.  The sleeveless tees are perfect for the days they go to summer camp. It helps keep them cool while they run around playing sports and participating in outdoor activities.
								<?php } ?>
					
					</p>	
				</div>
				<div class="col-md-5 col-sm-12 upload_style">
						<h3><?php if ($config_language=='ru') { echo 'Загрузите вашу<br> фотографию';} else { echo 'Upload your<br> photo';  }?></h3>
						<form method="post" name="send_file">
							<input type="text" class="form-control" placeholder="<?php if ($config_language=='ru') { echo 'Как вас зовут?';} else { echo 'Name';  }?>" name="name" id="image_name">
							<input type="text" class="form-control" placeholder="<?php if ($config_language=='ru') { echo 'Ваш Email';} else { echo 'Email';  }?>" name="email" id="image_email">
							<div class="image_file">
								<input disabled type="text" class="form-control" placeholder="<?php if ($config_language=='ru') { echo 'Ваша фотография';} else { echo 'Your photo';  }?>" name="photo_text"  id="image_file">
								<input type="file" name="photo" class="photo_file" id="photo_file_val" >
							</div>
						</form>
							<div class="btn btn-default"><?php if ($config_language=='ru') { echo 'Отправить';} else { echo 'Send';  }?></div>

				</div>
		</div>
</section>