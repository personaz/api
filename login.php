<?php
require_once('model/mahasiswa.php');
require_once('model/semesterMahasiswa.php');
require_once('model/matkulMahasiswa.php');
require_once('model/news.php');

$data = file_get_contents('php://input');
$post = json_decode($data);
$nim = $post->nim;
$pass = $post->password;
/**$nim = '1500300001';
$pass = 'zulham';*/
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

/**$sms = new SemesterMahasiswa();
$smes = $sms->getLatestSemesterForNIM($nim);
$mat = new MatkulMahasiswa();
echo json_encode($mat->getAllMatakuliahOnSemesterId($smes['id_smms']));
$news = new News();
echo json_encode($news->getNotDeletedNewsOrderedLatestNews());*/
echo json_encode($retu);
