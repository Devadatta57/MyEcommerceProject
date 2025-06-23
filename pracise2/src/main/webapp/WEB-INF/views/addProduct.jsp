<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        :root {
            --light-bg: #f9f9f9;
            --light-text: #444;
            --light-border: #ddd;
            --light-btn-bg: #764ba2;
            --light-btn-hover: #5a357f;

            --dark-bg: #1e1e2f;
            --dark-text: #ddd;
            --dark-border: #555;
            --dark-btn-bg: #9b59b6;
            --dark-btn-hover: #8e44ad;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: var(--dark-bg);
            color: var(--dark-text);
            transition: background 0.3s ease, color 0.3s ease;
        }

        .form-container {
            width: 420px;
            background: #2c2c3f;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.6);
            color: var(--dark-text);
            transition: background 0.3s ease, box-shadow 0.3s ease, color 0.3s ease;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1px;
            color: inherit;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            font-size: 14px;
            letter-spacing: 0.03em;
            color: inherit;
        }

        input[type="text"],
        input[type="number"],
        input[type="file"],
        textarea {
            width: 100%;
            margin-top: 8px;
            padding: 12px 15px;
            border-radius: 8px;
            border: 1.8px solid var(--dark-border);
            font-size: 15px;
            font-weight: 400;
            color: var(--dark-text);
            box-sizing: border-box;
            background: #3a3a53;
            transition: border-color 0.3s ease, box-shadow 0.3s ease, background 0.3s ease, color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="file"]:focus,
        textarea:focus {
            border-color: var(--dark-btn-bg);
            box-shadow: 0 0 8px rgba(155, 89, 182, 0.7);
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 90px;
            font-family: 'Roboto', Arial, sans-serif;
        }

        button {
            margin-top: 30px;
            width: 100%;
            padding: 14px;
            background: var(--dark-btn-bg);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: 700;
            font-size: 16px;
            cursor: pointer;
            letter-spacing: 0.05em;
            box-shadow: 0 6px 12px rgba(155, 89, 182, 0.7);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        button:hover {
            background: var(--dark-btn-hover);
            box-shadow: 0 8px 16px rgba(142, 68, 173, 0.8);
        }

    </style>
</head>
<body>

<div class="form-container">
    <h2>Add New Product</h2>
	<form action="/products/add" method="post" enctype="multipart/form-data">
	    <label for="name">Product Name *</label>
	    <input type="text" id="name" name="name" required />

	    <label for="price">Price *</label>
	    <input type="number" id="price" name="price" step="0.01" min="0" required placeholder="e.g. 499.99" />

	    <label for="quantity">Quantity *</label> <!-- ✅ NEW FIELD -->
	    <input type="number" id="quantity" name="quantity" min="0" required placeholder="e.g. 10" />

	    <label for="description">Description</label>
	    <textarea id="description" name="description" rows="4" placeholder="Optional"></textarea>

	    <label for="imageFile">Product Image</label>
	    <input type="file" id="imageFile" name="imageFile" accept="image/*" />

	    <button type="submit">Add Product</button>
	</form>

</div>

</body>
</html>
