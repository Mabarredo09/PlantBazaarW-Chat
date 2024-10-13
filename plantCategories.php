<?php
include 'conn.php';
session_start();

// Check if a user is logged in
$isLoggedIn = isset($_SESSION['email']) && !empty($_SESSION['email']);
$profilePic = ''; // Placeholder for the profile picture
$isSeller = false; // Flag to check if the user is a seller

if ($isLoggedIn) {
    $email = $_SESSION['email'];

    // Query to get the profile picture from the database
    $query = "SELECT id, proflePicture, firstname, lastname FROM users WHERE email = '$email'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $profilePic = $user['proflePicture'];  // Assuming you store the path to the profile picture
        $userId = $user['id'];
        $firstname = $user['firstname'];
        $lastname = $user['lastname'];
    }

    // If no profile picture is available, use a default image
    if (empty($profilePic)) {
        $profilePic = 'ProfilePictures/Default-Profile-Picture.png';  // Path to a default profile picture
    }

    // Query to check if the user is a seller
    $sellerQuery = "SELECT seller_id FROM sellers WHERE user_id = '$userId'";
    $sellerResult = mysqli_query($conn, $sellerQuery);

    if ($sellerResult && mysqli_num_rows($sellerResult) > 0) {
        $isSeller = true; // User is a seller
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="plantcategories.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="jquery.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4/dist/css/splide.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4/dist/js/splide.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <script src="node_modules/sweetalert2/dist/sweetalert2.all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body>
    <?php include 'nav.php'; ?>
<div class="container">
    <!-- Categories Container -->
<div class="categories-container">
    <!-- Plant Type -->
    <div class="plant-type">
        <h3>Plant Type</h3>
        <button class="clear-all">Clear All</button> <!-- Clear All Button -->
        <div class="plant-type-items">
            <label><input type="checkbox" class="category-checkbox" value="Outdoor"> Outdoor Plant</label>
            <label><input type="checkbox" class="category-checkbox" value="Indoor"> Indoor Plant</label>
            <label><input type="checkbox" class="category-checkbox" value="Flowers"> Flowers</label>
            <label><input type="checkbox" class="category-checkbox" value="Leaves"> Leaves</label>
            <label><input type="checkbox" class="category-checkbox" value="Bushes"> Bushes</label>
            <label><input type="checkbox" class="category-checkbox" value="Trees"> Trees</label>
            <label><input type="checkbox" class="category-checkbox" value="Climbers"> Climbers</label>
            <label><input type="checkbox" class="category-checkbox" value="Grasses"> Grasses</label>
            <label><input type="checkbox" class="category-checkbox" value="Succulent"> Succulent</label>
            <label><input type="checkbox" class="category-checkbox" value="Cacti"> Cacti</label>
            <label><input type="checkbox" class="category-checkbox" value="Aquatic"> Aquatic</label>
        </div>
    </div>

    <!-- Plant Size -->
    <div class="plant-size">
        <h3>Filter by Size</h3>
        <button class="clear-all">Clear All</button> <!-- Clear All Button -->
        <div class="plant-size-items">
            <label><input type="checkbox" class="size-checkbox" value="Seedlings"> Seedlings</label>
            <label><input type="checkbox" class="size-checkbox" value="Juvenile"> Juvenile</label>
            <label><input type="checkbox" class="size-checkbox" value="Adult"> Adult</label>
        </div>
    </div>

    <!-- Plant Location -->
    <div class="plant-location">
        <h3>Filter by Location</h3>
        <button class="clear-all">Clear All</button> <!-- Clear All Button -->
        <div id="locationCheckboxes"></div> <!-- Dynamic Location Checkboxes -->
    </div>
</div>

<!-- Newly Listed Plants -->
<!-- Newly Listed Plants -->
<div class="listed-plants">
    <div class="sort-container">
        <h1>Listed Plants</h1>
        <select id="sortPrice" class="sort-price-dropdown">
            <option value="">Sort by Price</option>
            <option value="low">Lowest to Highest</option>
            <option value="high">Highest to Lowest</option>
        </select>
    </div>
    <div class="newly-contents" id="newly-contents">
        <!-- Products will be loaded dynamically -->
    </div>
</div>

<script src="script.js"></script>
<script>
$(document).ready(function () {
    // Fetch Newly Listed Plants via AJAX
    $.ajax({
        url: 'Ajax/fetch_newly_listed.php',
        type: 'GET',
        dataType: 'json', // Ensure response is treated as JSON
        success: function (response) {
            try {
                let plants = response;

                if (!plants.length) {
                    $('#locationCheckboxes').html("<p>No plants available at the moment.</p>");
                    return;
                }

                // 1. Group locations uniquely from plants
                let locations = [...new Set(plants.map(p => p.city))]; // Unique location names
                
                // 2. Create the location checkboxes dynamically
                let locationCheckboxesHtml = locations.map(location => 
                    `<label>
                        <input type="checkbox" class="location-checkbox" value="${location}">
                        ${location}
                    </label><br>`
                ).join('');
                
                // 3. Inject the location checkboxes into the correct div
                $('#locationCheckboxes').html(locationCheckboxesHtml);

                // 4. Display all plants in the content area
                function displayPlants(plantsToDisplay) {
                    let contentHtml = plantsToDisplay.map(product => 
                        `<div class="plant-item" data-location="${product.city}" data-category="${product.plantcategories}" data-size="${product.plantSize}" data-price="${product.price}">
                            <div class="plant-image">
                                <img src="Products/${product.seller_email}/${product.img1}" alt="${product.plantname}">
                            </div>
                            <p>${product.plantname}</p>
                            <p>Price: ₱${product.price}</p>
                            <p>Category: ${product.plantcategories}</p>
                            <p>Size: ${product.plantSize}</p>
                            <div class="plant-item-buttons">
                                <button class="view-details" data-id="${product.plantid}" data-email="${product.seller_email}">View more details</button>
                                <button class="chat-seller" data-email="${product.seller_email}">Chat Seller</button>
                            </div>
                        </div>`
                    ).join('');
                    $('#newly-contents').html(contentHtml);
                }

                displayPlants(plants); // Initial display

                // 5. Handle sorting
                $('#sortPrice').on('change', function () {
                    let sortOrder = $(this).val();

                    // Sort the plants array based on selected option
                    if (sortOrder === 'low') {
                        plants.sort((a, b) => a.price - b.price); // Lowest to highest
                    } else if (sortOrder === 'high') {
                        plants.sort((a, b) => b.price - a.price); // Highest to lowest
                    }

                    // Display sorted plants while keeping the filters
                    filterPlants(); // Reapply filters to maintain filtering state
                });

                // 6. Handle checkbox change events for filtering
                $('.location-checkbox, .category-checkbox, .size-checkbox').on('change', filterPlants);

                // 7. Clear All Button Logic
                $('.clear-all').on('click', function () {
                    // Uncheck all checkboxes in their respective categories
                    $(this).closest('.plant-type').find('input[type="checkbox"]').prop('checked', false);
                    $(this).closest('.plant-size').find('input[type="checkbox"]').prop('checked', false);
                    $(this).closest('.plant-location').find('input[type="checkbox"]').prop('checked', false);
                    
                    // Reapply filter to show all plants
                    filterPlants(); // Reapply filter after clearing
                });

                // Filter Plants Function
                function filterPlants() {
                    let selectedLocations = $('.location-checkbox:checked').map(function () {
                        return $(this).val();
                    }).get();
                    let selectedCategories = $('.category-checkbox:checked').map(function () {
                        return $(this).val();
                    }).get();
                    let selectedSizes = $('.size-checkbox:checked').map(function () {
                        return $(this).val();
                    }).get();

                    let filteredPlants = plants.filter(function (plant) {
                        let plantLocation = plant.city;
                        let plantCategory = plant.plantcategories;
                        let plantSize = plant.plantSize;

                        let matchesLocation = !selectedLocations.length || selectedLocations.includes(plantLocation);
                        let matchesCategory = !selectedCategories.length || selectedCategories.includes(plantCategory);
                        let matchesSize = !selectedSizes.length || selectedSizes.includes(plantSize);

                        return matchesLocation && matchesCategory && matchesSize;
                    });

                    // Sort filtered plants before displaying
                    if ($('#sortPrice').val() === 'low') {
                        filteredPlants.sort((a, b) => a.price - b.price); // Lowest to highest
                    } else if ($('#sortPrice').val() === 'high') {
                        filteredPlants.sort((a, b) => b.price - a.price); // Highest to lowest
                    }

                    // Finally display the filtered and sorted plants
                    displayPlants(filteredPlants);
                }

                // View Details Button Event
                $(document).on('click', '.view-details', function () {
                    let plantId = $(this).data('id');
                    let sellerEmail = $(this).data('email');

                    let form = $('<form>', {
                        action: 'viewdetails.php',
                        method: 'GET'
                    }).append($('<input>', {
                        type: 'hidden',
                        name: 'plantId',
                        value: plantId
                    })).append($('<input>', {
                        type: 'hidden',
                        name: 'sellerEmail',
                        value: sellerEmail
                    }));

                    $('body').append(form);
                    form.submit();
                });

                // Chat Seller Button Event
                $(document).on('click', '.chat-seller', function () {
                    let sellerEmail = $(this).data('email');
                    window.location.href = `chat_upgrade/chat.php?seller_email=${encodeURIComponent(sellerEmail)}`;
                });

            } catch (e) {
                console.error("Error parsing JSON:", e);
            }
        },
        error: function (xhr, status, error) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Failed to load plants. Please try again.'
            });
        }
    });
});


</script>

    
</body>
</html>