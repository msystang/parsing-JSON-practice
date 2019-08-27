# Pursuit-Core-iOS-Parsing-JSON-Lab

## Organizing Structure

- Create a Tab Bar Controller.  
- Each Tab in the Tab Bar Controller should be a Navigation Controller
- The Navigation Controller should have a View Controller with a Table View as its Root View Controller
- Selecting a cell in the Table View should segue to a Detail View Controller with additional information.

## Parsing Data

- Below are the endpoints to hit.  For each endpoint, select a search query and copy and paste the JSON into Xcode.  Make a new file called customname.json and save it at the top level of your project.  For each JSON file, create a model that conforms to `Codable`, then build your Table View and associated Detail View Controller.

# Endpoint One

### [Open Weather API](https://openweathermap.org/current) (Use "Cities within a rectangle zone")

Show a list of all of the cities in your query.  Selecting a city should segue to a detailVC showing the current temperature and weather.


# Endpoint Two

### [The Color Api](http://www.thecolorapi.com/docs#schemes-generate-scheme-get)

Display a list of all of the names of the colors from your query.  The color of each cell should match the color of the object.  Selecting a cell should segue to a detailVC with the hex value and rgb values displayed.

# Endpoint Three

### [Random User Generator API](https://randomuser.me/documentation)

Display a list of at least 50 users showing their name and email address.  Selecting a user should segue to a detailVC showing their full address, phone number, and date of birth.
