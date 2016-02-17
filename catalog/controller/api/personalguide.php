<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/php_mailer/class.phpmailer.php';
class ControllerApiPersonalGuide extends Controller {
	public function index() {
		$output = '';
		if (!isset($this->request->post['name'])) {
			$output = 'Нет поля name';
		} else {
			if (!isset($this->request->post['email'])) {
				$output = 'Нет поля email';
			} else {
				$name = htmlspecialchars(trim($this->request->post['name']));
				$from_email = htmlspecialchars(trim($this->request->post['email']));
				$address = $this->config->get('config_personal_guide_email');

				$email = new PHPMailer();
				$email->From      = 'callback@weblama.me';
				$email->FromName  = $name;
				$email->Subject   = 'Подбор персонального имиджа';
				$email->Body      = 'sended to ' . $address . ' from ' . $name . ' ' . $from_email;
				$email->AddAddress($address);

				if (isset($_FILES['photo'])) {
					$email->AddAttachment($_FILES['photo']['tmp_name'], basename($_FILES['photo']['name']));
					$output = 'sended to ' . $address . ' from ' . $name . ' ' . $from_email . ' ' . $_FILES['photo']['tmp_name'];
				} else {
					$output = 'sended to ' . $address . ' from ' . $name . ' ' . $from_email;
				}

				$email->Send();			
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
