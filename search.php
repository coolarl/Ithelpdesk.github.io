<?php
include 'templates/header.php';
require 'function.php';

class KeluhanStatus
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getStatusData($keyword)
    {
        return query("SELECT * FROM pengaduan WHERE id = '$keyword'");
    }
}

$keluhanStatus = new KeluhanStatus($conn);

?>

<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<h1 class="display-4" style="margin-top: -50px;">Status Keluhan Anda</h1>

<div data-aos="fade-right" data-aos-duration="1000" class="row">
    <div class="col">
        <?php
        $keyword = $_POST['keyword'];
        $data = $keluhanStatus->getStatusData($keyword);
        if ($data) {
            foreach ($data as $d) :
        ?>
             <div class="table-responsive">
                <table  class="table table-bordered" style="width: 600px;" >
                    <tr>
                        <th>Nomor Laporan</th>
                        <td><?= $d['id']; ?></td>
                    </tr>
                    <tr>
                        <th>Tanggal Lapor</th>
                        <td><?= $d['tgl_lapor']; ?></td>
                    </tr>
                    <tr>
                        <th>Nama Pelapor</th>
                        <td><?= $d['n_pelapor']; ?></td>
                    </tr>
                    <tr>
                        <th>Jabatan</th>
                        <td><?= $d['j_pelapor']; ?></td>
                    </tr>
                    <tr>
                        <th>Unit Kerja</th>
                        <td><?= $d['d_pelapor']; ?></td>
                    </tr>
                    <tr>
                        <th>Kendala</th>
                        <td><?= $d['n_barang']; ?></td>
                    </tr>
                    <tr>
                        <th>Keterangan</th>
                        <td><?= $d['ket']; ?></td>
                    </tr>
                    <tr>
                        <th>Status</th>
                        <td><?= $d['status']; ?></td>
                    </tr>
                   

                    <tr>
                        <th><b><u>Catatan dari IT Helpdesk</u></b></th>
                        <td><?= $d['ket_petugas']; ?></td>
                    </tr>
                </table>
                </div>
                <br>
                <a href="index.php" class="btn btn-sm btn-primary" style="width: 80px;"><span class="fas fa-arrow-left mr-2"></span>Back</a>
        <?php
            endforeach;
        } else {
            echo "<p>Data laporan tidak ditemukan.</p>";
        }
        ?>
    </div>
</div>

<?php
include 'templates/footer.php';
?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init({
        once: true,
    });
</script>
<script>
    const scriptURL = '<https://script.google.com/macros/s/AKfycbwEmWNlm00S4Mi7eYm-44Lf2HAESV3Nn_s7nB9rsbC-edRODluWWBrkJnHbCEpvs3pONA/exec>';
    const form = document.forms['contact-me'];

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        fetch(scriptURL, { method: 'POST', body: new FormData(form) })
            .then((response) => console.log('Success!', response))
            .catch((error) => console.error('Error!', error.message));
    });
</script>
