<?php
require_once('model/mahasiswa.php');

$data = file_get_contents('php://input');
$post = json_decode($data);

$ms = new Mahasiswa();
if ($post->old && $post->new && $post->nim && $ms->Login($post->nim, $post->old)) {
    $ms->changePasswordForMahasiswaByNIM($post->new, $post->nim);
    $ret = array(
        'response' => 'success'
    );
} else {
    $ret = array(
        'response' => 'failed'
    );
}
echo json_encode($ret);
