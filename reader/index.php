<?php
include 'navbar.php';
$stories = fetchStories();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Story</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style/home.css">
</head>


<body style="background-color:#FFFFFF;">
    <div class="container mt-5 pt-3">
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <?php
            foreach ($stories as $story) {
                echo '<div class="col" style="margin-bottom:30px;">';
                echo '<a href="../read/story.writer.php?id=' . $story["id"] . '" class="card-link">';
                echo '<div class="story card">';
                echo '<div class="card-body">';
                echo '<h5 class="card-title">' . $story["title"] . '</h5>';
                if (!empty($story["image_path"])) {
                    echo '<img src="../write/' . $story["image_path"] . '" alt="Story Image" style="border-radius:10px;display: block; margin: auto; width:100%; height:200px; object-fit: cover; margin-top:20px;">';
                } else {
                    echo '<img src="../image/book_3145755.png" style="display: block; margin: auto;width:72px;height:72px;margin-top:70px;">';
                }
                echo '<h6 class="card-subtitle mb-2 text-muted" style="text-align:center;position: absolute; bottom: 10px; left: 10px; right: 10px;">Author: ' . $story["author"] . '</h6>';
                echo '</div>'; // close card-body
                echo '</div>'; // close card
                echo '</a>'; // close anchor tagC:\xampp\htdocs\Tugaspipl\uploads
                echo '</div>'; // close col
            }
            ?>
        </div> <!-- close row -->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>