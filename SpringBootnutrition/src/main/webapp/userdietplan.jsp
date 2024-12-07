<%@page import="com.klef.jfsd.springboot.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve the user object from the session
    User u = (User) session.getAttribute("user");

    // If the user is null, redirect to the login page
    if (u == null) {
        response.sendRedirect("usersessionexpiry.jsp");
        return;
    }
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diet Plans</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f4f9;
            color: #333;
        }

        /* Main Content */
        .main-content {
            margin-left: 260px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .main-content:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .welcome {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome h1 {
            font-size: 36px;
            color: #2C3E50;
        }

        .welcome p {
            font-size: 18px;
            color: #7F8C8D;
        }

        /* Diet Plan Section */
        .section {
            margin-bottom: 40px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            font-size: 26px;
            color: #16A085;
            margin-bottom: 20px;
            text-align: center;
        }

        .food-item-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-around;
        }

        .food-item {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 250px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            cursor: pointer;
            position: relative;
            text-align: center;
        }

        .food-item:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .food-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
            transition: transform 0.3s ease;
        }

        .food-item img:hover {
            transform: scale(1.1);
        }

        .food-item h3 {
            margin-top: 15px;
            font-size: 22px;
            color: #2C3E50;
        }

        .food-item p {
            color: #7F8C8D;
            font-size: 16px;
        }

        .food-item .nutrition-info {
            background-color: #34495E;
            color: white;
            padding: 10px;
            border-radius: 5px;
            font-size: 12px;
            position: absolute;
            top: 10px;
            right: 10px;
            display: none;
        }

        .food-item:hover .nutrition-info {
            display: block;
        }

        button {
            padding: 12px 20px;
            background-color: #16A085;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #1abc9c;
        }

        /* Responsive Styling */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 15px;
            }

            .food-item-list {
                flex-direction: column;
                align-items: center;
            }

            .food-item {
                width: 80%;
                margin-bottom: 20px;
            }

            .section h2 {
                font-size: 22px;
            }

            .welcome h1 {
                font-size: 28px;
            }
        }

    </style>
</head>
<body>

<%@ include file="sidebar.jsp" %>

    <div class="main-content">
        <div class="welcome">
            <h1><span id="user-name"><%=u.getName() %></span>!</h1>
            <p>Find your perfect diet plan based on your preferences.</p>
        </div>

        <!-- Diet Plan Section -->
        <div class="section" id="dietplans">
            <h2>Diet Plan Options</h2>

            <div class="food-item-list">
                <!-- Food Item 1: Non-Veg Diet -->
                <div class="food-item" onclick="selectFood(this)">
                    <img src="https://s23209.pcdn.co/wp-content/uploads/2015/06/Easy-Grilled-Chicken_068-760x1140.jpg" alt="Grilled Chicken">
                    <h3>Non-Veg Diet</h3>
                    <p>Chicken, Fish, Eggs, etc.</p>
                    <div class="nutrition-info">
                        <p>Calories: 300</p>
                        <p>Protein: 30g</p>
                        <p>Fat: 15g</p>
                        <p>Carbs: 20g</p>
                        <p>Sodium: 500mg</p>
                        <p>Fiber: 5g</p>
                    </div>
                </div>

                <!-- Food Item 2: Veg Diet -->
                <div class="food-item" onclick="selectFood(this)">
                    <img src="https://www.shape.com/thmb/m5rCSe5aPCBwiQdrbRxt0pc4Syw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/vegetarian-recipes-weight-loss_0-8af3c457c2f44cf4b293f4b71c33c5df.jpg" alt="Vegetarian">
                    <h3>Veg Diet</h3>
                    <p>Leafy Greens, Tofu, Grains, etc.</p>
                    <div class="nutrition-info">
                        <p>Calories: 200</p>
                        <p>Protein: 12g</p>
                        <p>Fat: 5g</p>
                    </div>
                </div>

                <!-- Food Item 3: Balanced Diet -->
                <div class="food-item" onclick="selectFood(this)">
                    <img src="https://assets.nhs.uk/prod/images/T_0318_vegetarian-meal-guide_91601.2e16d0ba.fill-920x613.jpg" alt="Balanced Meal">
                    <h3>Balanced Diet</h3>
                    <p>Mix of Veg & Non-Veg</p>
                    <div class="nutrition-info">
                        <p>Calories: 400</p>
                        <p>Protein: 25g</p>
                        <p>Fat: 20g</p>
                    </div>
                </div>

               <!-- Food Item 4: Keto Diet -->
			<div class="food-item" onclick="selectFood(this)">
			    <img src="https://www.healthline.com/hlcmsresource/images/AN_images/keto-diet-foods-1296x728-feature.jpg" alt="Keto Diet">
			    <h3>Keto Diet</h3>
			    <p>High fat, low carb foods</p>
			    <div class="nutrition-info">
			        <p>Calories: 350</p>
			        <p>Protein: 25g</p>
			        <p>Fat: 30g</p>
			        <p>Carbs: 5g</p>
			        <p>Sodium: 600mg</p>
			        <p>Fiber: 3g</p>
			    </div>
			</div>
			
			<!-- Food Item 5: Vegan Diet -->
			<div class="food-item" onclick="selectFood(this)">
			    <img src="https://www.veganfoodandliving.com/wp-content/uploads/2020/04/vegan-lunch-ideas.jpg" alt="Vegan Diet">
			    <h3>Vegan Diet</h3>
			    <p>Plant-based foods, no animal products</p>
			    <div class="nutrition-info">
			        <p>Calories: 250</p>
			        <p>Protein: 10g</p>
			        <p>Fat: 12g</p>
			        <p>Carbs: 35g</p>
			        <p>Sodium: 400mg</p>
			        <p>Fiber: 8g</p>
			    </div>
			</div>
			
			<!-- Food Item 6: Mediterranean Diet -->
			<div class="food-item" onclick="selectFood(this)">
			    <img src="https://www.medicalnewstoday.com/content/images/articles/323501/323501_1.jpg" alt="Mediterranean Diet">
			    <h3>Mediterranean Diet</h3>
			    <p>Olive oil, fish, vegetables, fruits</p>
			    <div class="nutrition-info">
			        <p>Calories: 300</p>
			        <p>Protein: 20g</p>
			        <p>Fat: 18g</p>
			        <p>Carbs: 25g</p>
			        <p>Sodium: 450mg</p>
			        <p>Fiber: 7g</p>
			    </div>
			</div>
			
			<!-- Food Item 7: Paleo Diet -->
			<div class="food-item" onclick="selectFood(this)">
			    <img src="https://www.paleoplan.com/wp-content/uploads/2020/01/paleo-foods-800x500.jpg" alt="Paleo Diet">
			    <h3>Paleo Diet</h3>
			    <p>Meats, fish, fruits, vegetables, nuts</p>
			    <div class="nutrition-info">
			        <p>Calories: 400</p>
			        <p>Protein: 30g</p>
			        <p>Fat: 25g</p>
			        <p>Carbs: 15g</p>
			        <p>Sodium: 500mg</p>
			        <p>Fiber: 6g</p>
			    </div>
			</div>
			
			<!-- Food Item 8: Low-Carb Diet -->
			<div class="food-item" onclick="selectFood(this)">
			    <img src="https://www.diabetes.co.uk/images/low-carb-diet-hero.jpg" alt="Low-Carb Diet">
			    <h3>Low-Carb Diet</h3>
			    <p>Reduced carbohydrate intake</p>
			    <div class="nutrition-info">
			        <p>Calories: 280</p>
			        <p>Protein: 22g</p>
			        <p>Fat: 15g</p>
			        <p>Carbs: 10g</p>
			        <p>Sodium: 600mg</p>
			        <p>Fiber: 4g</p>
			    </div>
			</div>


            </div>
        </div>

    </div>

    <script>
        function selectFood(element) {
            // Function to handle food item selection
            alert("You selected: " + element.querySelector("h3").innerText);
        }
    </script>
</body>
</html>
