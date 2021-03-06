<?php
class ControllerApiPBC extends Controller {
	public function index() {
    $this->load->model('catalog/category');
    $this->load->model('catalog/product');
    $this->load->model('tool/image');
    
    $json = array();
    
    $category_id = $this->request->get['category_id'];
    $filter_data = array(
      'filter_category_id' => $category_id
    );
    
    $results = $this->model_catalog_product->getProducts($filter_data);
    
    foreach ($results as $result) {
      if ($result['image']) {
        $image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
      } else {
        $image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
      }

      if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
      } else {
        $price = false;
      }

      if ((float)$result['special']) {
        $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
      } else {
        $special = false;
      }

      if ($this->config->get('config_tax')) {
        $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
      } else {
        $tax = false;
      }

      if ($this->config->get('config_review_status')) {
        $rating = (int)$result['rating'];
      } else {
        $rating = false;
      }

      $json[] = array(
        'product_id'  => $result['product_id'],
        'thumb'       => $image,
        'name'        => $result['name'],
        'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
        'price'       => $price,
        'special'     => $special,
        'tax'         => $tax,
        'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
        'rating'      => $result['rating'],
        'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
      );
    }

    if (isset($this->request->server['HTTP_ORIGIN'])) {
      $this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
      $this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
      $this->response->addHeader('Access-Control-Max-Age: 1000');
      $this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
    }

    $this->response->addHeader('Content-Type: application/json');
    $this->response->setOutput(json_encode($json));
	}
}
