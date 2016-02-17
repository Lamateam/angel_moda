<?php
class ModelOneclickbuyOneclickbuy extends Model {
	public function add($data) {
    $this->load->model('catalog/product');
    $price = $this->model_catalog_product->getProduct($data['product_id'])['price'] * $data['quantity'];
    $query = "INSERT INTO " . DB_PREFIX . "oneclickbuy SET name = '" . $data['name'] . "', phone = '" . $data['phone'] . "', address = '" . $data['address'] . "', delivery_type = '" . (int)$data['delivery_type'] . "', `is_gift` = '" . (isset($data['is_gift']) ? (int)$data['is_gift'] : 0) . "', `product_id` = '" . (int)$data['product_id'] . "', quantity = '" . (int)$data['quantity'] . "', price = '" . $price . "', created_at = NOW()";
    $this->db->query($query);
  }
}