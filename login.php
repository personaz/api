<?php
require_once 'model/mahasiswa.php';
require_once 'Zend/Debug.php';

$data = file_get_contents('php://input');
$post = json_decode($data);
$nim = $post->nim;
$pass = $post->password;
if(!$nim || !$pass) {
    echo json_encode(array(
        'status' => 'fail',
    ));
}

$ms = new Mahasiswa();
try {
    $retu = $ms->Login($nim, $pass);
} catch(PDOException $e) {
    $retu = array(
        'status'    => 'fail',
        'error'     => $e->getMessage(),
    );
}

echo json_encode($retu);