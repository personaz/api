<?php
require_once('model/mahasiswa.php');

$data = file_get_contents('php://input');
$post = json_decode($data);
$nim = $post->nim;

$ms = new Mahasiswa();
$ret = $ms->getRowMahasiswaByNIM($nim) ?: array();
echo json_encode($ret);
