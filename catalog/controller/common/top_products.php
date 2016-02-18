<?php
class ControllerCommonTopProducts extends Controller {
	public function index() {
    $this->load->model('catalog/category');
    $this->load->model('catalog/product');
    $this->load->model('tool/image');
    
    $products = array();
    
    $filter_data = array(
      'filter_category_id' => '77'
    );
    
		$ps = $this->model_catalog_product->getProducts($filter_data);

		foreach ($ps as $product_info) {
			$p = array();
			$p['name'] = $product_info['name'];
			$p['product_id'] = (int)$product_info['product_id'];
			$p['manufacturer'] = $product_info['manufacturer'];
			$p['manufacturer_image'] = $product_info['manufacturer_image'];
			$p['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$p['model'] = $product_info['model'];
			$p['reward'] = $product_info['reward'];
			$p['points'] = $product_info['points'];
			$p['description'] = html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8');

			if ($product_info['quantity'] <= 0) {
				$p['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$p['stock'] = $product_info['quantity'];
			} else {
				$p['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$p['popup'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
			} else {
				$p['popup'] = '';
			}

			if ($product_info['image']) {
				$p['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));
			} else {
				$p['thumb'] = '';
			}

			$p['images'] = array();

			$results = $this->model_catalog_product->getProductImages($product_info['product_id']);

			foreach ($results as $result) {
				$p['images'][] = array(
					'popup' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height')),
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))
				);
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$p['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$p['price'] = false;
			}

			if ((float)$product_info['special']) {
				$p['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$p['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$p['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
			} else {
				$p['tax'] = false;
			}

			$discounts = $this->model_catalog_product->getProductDiscounts($product_info['product_id']);

			$p['discounts'] = array();

			foreach ($discounts as $discount) {
				$p['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')))
				);
			}

			$p['options'] = array();

			foreach ($this->model_catalog_product->getProductOptions($product_info['product_id']) as $option) {
				$product_option_value_data = array();

				foreach ($option['product_option_value'] as $option_value) {
					if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {
						if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
							$price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
						} else {
							$price = false;
						}

						$product_option_value_data[] = array(
							'product_option_value_id' => $option_value['product_option_value_id'],
							'option_value_id'         => $option_value['option_value_id'],
							'name'                    => $option_value['name'],
							'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
							'price'                   => $price,
							'price_prefix'            => $option_value['price_prefix']
						);
					}
				}

				$p['options'][] = array(
					'product_option_id'    => $option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $option['option_id'],
					'name'                 => $option['name'],
					'type'                 => $option['type'],
					'value'                => $option['value'],
					'required'             => $option['required']
				);
			}

			if ($product_info['minimum']) {
				$p['minimum'] = $product_info['minimum'];
			} else {
				$p['minimum'] = 1;
			}

			$p['review_status'] = $this->config->get('config_review_status');

			if ($this->config->get('config_review_guest') || $this->customer->isLogged()) {
				$p['review_guest'] = true;
			} else {
				$p['review_guest'] = false;
			}

			if ($this->customer->isLogged()) {
				$p['customer_name'] = $this->customer->getFirstName() . '&nbsp;' . $this->customer->getLastName();
			} else {
				$p['customer_name'] = '';
			}

			$p['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$p['rating'] = (int)$product_info['rating'];

			// Captcha
			if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('review', (array)$this->config->get('config_captcha_page'))) {
				$p['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'));
			} else {
				$p['captcha'] = '';
			}

			$p['attribute_groups'] = $this->model_catalog_product->getProductAttributes($product_info['product_id']);

			$p['products'] = array();

			$p['tags'] = array();

			$p['href'] = $this->url->link('product/product', 'product_id=' . $p['product_id']);

			if ($product_info['tag']) {
				$tags = explode(',', $product_info['tag']);

				foreach ($tags as $tag) {
					$p['tags'][] = array(
						'tag'  => trim($tag),
						'href' => $this->url->link('product/search', 'tag=' . trim($tag))
					);
				}
			}

			$p['recurrings'] = $this->model_catalog_product->getProfiles($product_info['product_id']);

			$products[] = $p;
		}

    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/top_products.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/top_products.tpl', array('products' => $products));
		} else {
			return $this->load->view('default/template/common/top_products.tpl', array('products' => $products));
		}
	}
}
