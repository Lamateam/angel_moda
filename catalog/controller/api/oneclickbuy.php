<?php
class ControllerApiOneclickbuy extends Controller {
	public function index() {
		$output = '';
		if (!isset($this->request->post['name'])) {
			$output = 'Нет поля name';
		} else {
			if (!isset($this->request->post['phone'])) {
				$output = 'Нет поля phone';
			} else {
        if (!isset($this->request->post['address'])) {
          $output = 'Нет поля address!';
        } else {
          if (!isset($this->request->post['is_gift'])) {
            $output = 'Нет поля is_gift';
          } else {
            if (!isset($this->request->post['delivery_type'])) {
              $output = 'Нет поля delivery_type';
            } else {
              if (!isset($this->request->post['product_id'])) {
                $output = 'Нет поля product_id';
              } else {
                if (!isset($this->request->post['quantity'])) {
                  $output = 'Нет поля quantity';
                } else {
                  $output = 'ok';

                  $this->load->model('oneclickbuy/oneclickbuy');

                  $name = htmlspecialchars(trim($this->request->post['name']));
                  $phone = htmlspecialchars(trim($this->request->post['phone']));
                  $address = htmlspecialchars(trim($this->request->post['address']));
                  $is_gift = htmlspecialchars(trim($this->request->post['is_gift']));
                  $delivery_type = htmlspecialchars(trim($this->request->post['delivery_type']));
                  $product_id = htmlspecialchars(trim($this->request->post['product_id']));
                  $quantity = htmlspecialchars(trim($this->request->post['quantity']));

                  $this->model_oneclickbuy_oneclickbuy->add(array('name'=>$name, 'phone'=>$phone, 'address'=>$address, 'is_gift'=>$is_gift, 'delivery_type'=>$delivery_type, 'product_id'=>$product_id, 'quantity'=>$quantity));
                }
              }
            }
          }
        }	
			}
		}

		if (isset($this->request->server['HTTP_ORIGIN'])) {
			$this->response->addHeader('Access-Control-Allow-Origin: ' . $this->request->server['HTTP_ORIGIN']);
			$this->response->addHeader('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
			$this->response->addHeader('Access-Control-Max-Age: 1000');
			$this->response->addHeader('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
		}

		$this->response->addHeader('Content-Type: text/html; charset=utf-8');
		$this->response->setOutput($output);
	}
}
