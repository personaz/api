<?php
require_once('model/mahasiswa.php');
require_once('model/news.php');

$data = file_get_contents('php://input');
$post = json_decode($data);
$nim = $post->nim;

$ms = new Mahasiswa();
$ret = array();
if ($ms->getRowMahasiswaByNIM($nim)) {
    $news = new News();
    $ret = $news->getNotDeletedNewsOrderedLatestNews();
}
echo json_encode($ret);
