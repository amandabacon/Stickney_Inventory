<?php

try {
    $db = new PDO('psql:dbname=stickney_db;charset=utf8',
                    'amandabacon');
}
catch(PDOException $ex) {
    echo "did not connect...";
}

header('Content-Type: text/csv');
header('Content-Disposition: attachment;filename=exported-sobset_csv.csv');

$sql = "SELECT * FROM sobset;";

$sth = $db->prepare($sql);
$sth->execute();

$filename = date('d.m.Y').'.csv';

$data = fopen($filename, 'w');

while ($row = $sth->fetch(PDO::FETCH_ASSOC)) {
    fputcsv($data, $row);
    print_r($row);
}

echo "\r\n";

fclose($data);

?>
