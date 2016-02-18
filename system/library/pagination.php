<?php
class Pagination {
	public $total = 0;
	public $page = 1;
	public $limit = 20;
	public $num_links = 8;
	public $url = '';
	public $text_first = '';
	public $text_last = '';
	public $text_next = '<span class="next_text">Следующая</span>';
	public $text_prev = '<span class="next_text">Предыдущая</span>';

	public function render() {
		$total = $this->total;

		if ($this->page < 1) {
			$page = 1;
		} else {
			$page = $this->page;
		}

		if (!(int)$this->limit) {
			$limit = 10;
		} else {
			$limit = $this->limit;
		}

		$num_links = $this->num_links;
		$num_pages = ceil($total / $limit);

		$this->url = str_replace('%7Bpage%7D', '{page}', $this->url);



		$output = "<div class='pagination_block'>";

		

		$output .= '<ul class="pagination">';

		if ($page > 1) {
			
			$output .= '<li class="pagination_nav pagination_left "><a  href="' . str_replace('{page}', $page - 1, $this->url) . '">' . $this->text_prev . '</a></li>';
		}else{
			$output .= '<li class="pagination_nav pagination_left disabled_cur"><span>' . $this->text_prev . '</span></li>';
		}


		if ($num_pages > 1) {
			if ($num_pages <= $num_links) {
				$start = 1;
				$end = $num_pages;
			} else {
				$start = $page - floor($num_links / 2);
				$end = $page + floor($num_links / 2);

				if ($start < 1) {
					$end += abs($start) + 1;
					$start = 1;
				}

				if ($end > $num_pages) {
					$start -= ($end - $num_pages);
					$end = $num_pages;
				}
			}

			for ($i = $start; $i <= $end; $i++) {
				if ($page == $i) {
					$output .= '<li class="active"><span>' . $i . '</span></li>';
				} else {
					$output .= '<li><a href="' . str_replace('{page}', $i, $this->url) . '">' . $i . '</a></li>';
				}
			}
		}

			if ($page < $num_pages) {
			$output .= '<li class="pagination_nav pagination_right"> <a href="' . str_replace('{page}', $page + 1, $this->url) . '">' . $this->text_next . '</a></li>';	
		}
		

		$output .= '</ul>';

	


		$output .= "</div>";
		if ($num_pages > 1) {
			return $output;
		} else {
			return '';
		}
	}
}