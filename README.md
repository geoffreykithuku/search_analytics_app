<!-- 
Search Analytics Application
This Search Analytics Application is designed to track and analyze user search queries in real-time. It efficiently records complete search queries, increments the count for repeated queries, and discards incomplete queries to maintain accurate search data.

Table of Contents
Features
Technologies Used
Installation
Usage
Routes
Example
Contributing
License
Features
Real-time Query Tracking: Records search queries as users type.
Duplicate Query Handling: Increments count for repeated queries.
Incomplete Query Filtering: Discards incomplete queries to avoid clutter.
IP Tracking: Logs the IP address of users performing searches.
Technologies Used
Ruby on Rails
PostgreSQL
JavaScript (Vanilla)
HTML/CSS
Installation
To set up this project locally, follow these steps:

Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/search_analytics_app.git
cd search_analytics_app
Install dependencies:

bash
Copy code
bundle install
Set up the database:

Ensure PostgreSQL is installed and running. Then, create and migrate the database:

bash
Copy code
rails db:create
rails db:migrate
Start the Rails server:

bash
Copy code
rails server
Visit the application:

Open your browser and navigate to http://localhost:3000.

Usage
Search Functionality
Enter your search query in the input box. The application will automatically log complete queries and discard incomplete ones.
View the analytics table to see recorded queries and their counts.
Routes
POST /search_queries: Used to log a new search query.
GET /search_queries: Displays the search queries along with their counts.
JavaScript
The application uses vanilla JavaScript to handle input events and send AJAX requests for logging search queries.

javascript
Copy code
document.addEventListener("DOMContentLoaded", function() {
    const searchBox = document.getElementById("search-box");
    let timeout = null;
    let lastQuery = "";

    if (searchBox) {
        searchBox.addEventListener("input", function(event) {
            clearTimeout(timeout);

            timeout = setTimeout(function() {
                const query = event.target.value.trim();

                // Only log the query if it is complete and different from the last logged query
                if (query.length > 0 && query !== lastQuery && !query.endsWith(" ")) {
                    lastQuery = query;

                    const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");

                    fetch("/search_queries", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "X-CSRF-Token": csrfToken,
                        },
                        body: JSON.stringify({ search_query: { query: query } }),
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log("Search query logged:", data);
                    });
                }
            }, 300);
        });
    }
});
Example
Here is an example of how the application processes search queries:

User types "What is":

The query is not logged because it is incomplete.
User continues typing "What is a good car":

The query "What is a good car" is logged and saved.
Any incomplete queries like "What is" are discarded.
Another user types "How is":

The query is not logged because it is incomplete.
User completes the query "How is the weather today":

The query "How is the weather today" is logged and saved.
Any incomplete queries like "How is" are discarded.
Contributing
We welcome contributions to improve this project. To contribute:

Fork the repository.
Create a new branch for your feature or bugfix.
Make your changes and commit them with clear and concise messages.
Push your changes to your forked repository.
Create a pull request to the main repository. -->



## Search Analytics Application

This Search Analytics Application is designed to track and analyze user search queries in real-time. It efficiently records complete search queries, increments the count for repeated queries, and discards incomplete queries to maintain accurate search data.

### Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Routes](#routes)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

### Features

- **Real-time Query Tracking:** Records search queries as users type.
- **Duplicate Query Handling:** Increments count for repeated queries.
- **Incomplete Query Filtering:** Discards incomplete queries to avoid clutter.
- **IP Tracking:** Logs the IP address of users performing searches.

### Technologies Used

- Ruby on Rails
- PostgreSQL
- JavaScript (Vanilla)
- HTML/CSS

### Installation

To set up this project locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone git@github.com:geoffreykithuku/search_analytics_app.git
    cd search_analytics_app
    ```
2. Install dependencies:

    ```bash
    bundle install
    ```
3. Set up the database:

4. Start the Rails server:

    ```bash
    rails server
    ```
5. Visit the application:
    
        Open your browser and navigate to http://localhost:3000.

### Usage

#### Search Functionality

- Enter your search query in the input box. The application will automatically log complete queries and discard incomplete ones.
- View the analytics table to see recorded queries and their counts.

### Routes

- **POST /search_queries:** Used to log a new search query.
- **GET /search_queries:** Displays the search queries along with their counts.

### JavaScript

The application uses vanilla JavaScript to handle input events and send AJAX requests for logging search queries.

```javascript
document.addEventListener("DOMContentLoaded", function() {
    const searchBox = document.getElementById("search-box");
    let timeout = null;
    let lastQuery = "";

    if (searchBox) {
        searchBox.addEventListener("input", function(event) {
            clearTimeout(timeout);

            timeout = setTimeout(function() {
                const query = event.target.value.trim();

                // Only log the query if it is complete and different from the last logged query
                if (query.length > 0 && query !== lastQuery && !query.endsWith(" ")) {
                    lastQuery = query;

                    const csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");

                    fetch("/search_queries", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "X-CSRF-Token": csrfToken,
                        },
                        body: JSON.stringify({ search_query: { query: query } }),
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log("Search query logged:", data);
                    });
                }
            }, 300);
        });
    }
});
```


### Contributing

We welcome contributions to improve this project. To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them with clear and concise messages.
4. Push your changes to your forked repository.
5. Create a pull request to the main repository.

### License

This project is open source and available under the [MIT License](LICENSE).
