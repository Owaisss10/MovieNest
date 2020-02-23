# MovieNest

MovieNest is an iOS Application designed for movie suggestions. This app uses IMDB services to fetch movies on the Genre preferences.

#### Video Link: [Movie Nest native iOS on YouTube](https://youtu.be/cEkFP4JAEYs)   

#### Features:
  1.  Popular Movies
  2.  Movies filtered on Genre preference
  3.  Pagination/Lazy Loading
  4.  Movie Details (Story, Rating, Popularity, Votes, Release Date)

### Explaination:

#### System Architecture:
This application was developed on Xcode IDE. Xcode is used for creating native iOS, watchOS, tvOS applications. Xcode does not generate the code for any application. Developer has to design the screens first and then connect the code with the design.

**MVC** design pattern was used in the application. This application is developed on Swift language. Let me explain a little about the MVC approach I used. As MVC is Model-View-Controller, I organized the app in this way:

**Models:**
1. PopularMoviesResponse (Array of popular movies with each movie details)
2. GenreResponse (Array of IMDB Genre names and ids)
3. MovieResponse (Array of a specific genre movies with each movie details

**Views:**
1. Main.storyboard (where I have the UI Views designed)

**Controllers:**
1. WelcomeVC (App first intro screen)
2. HomeVC (Popular movies grid)
3. AllGenresTVC (List of All IMDB Genres)
4. AllMoviesTVC (List of movies based on Genre)
5. MovieDetailsVC (Movie details screen)

**File Naming Conventions:**

* **VC** are ViewControllers
* **TVC** are TableViewControllers
* **CCell** are CollectionViewCells
* **TCell** are TableViewCells

There is another folder in the app:

**Helpers:**
1. **Constants** (constants used in the app such as URLs, API End Points, APIKeys, Colors)
2. **Extensions** (Helping functions written one time to access anywhere)
3. **APIManager** (API calls)

App images are places in **Assets.xcassets** folder

#### Logo Designing:

I designed the logo myself from [Canva.com](https://www.canva.com/) and followed app theme by colors used in the logo (Dark Gray & Yellow)

#### Backend TMDB API:

The app is fetching data from The Movie Database.(themoviedb.org) **TMDB** is an open system that provides IMDB movies data through diffrent APIs. I used the version 3 of TMDB APIs. Following APIs from TMDB have been used:

1. Fetching Specific Movies based on Genre:
**/discover/movie?**<API_Key>&**with_genres=<genre_id>**

2. Fethcing Popular Movies:
**/movie/popular?**

3. Fethcing All Genre Names & Ids
**/genre/movie/list**


### Cocoapods:

MovieNest uses a number of open source 3rd Party Libraries to for better user experience:

* [RappleProgressHUD](https://github.com/rjeprasad/RappleProgressHUD) - Custom Activity Indicator(Loader/Spinner)
* [SCLAlertView](https://github.com/vikmeup/SCLAlertView-Swift) - Custom Styled Alert Views (Dialog Box)
* [Alamofire](https://github.com/Alamofire/Alamofire) - An HTTP networking library.
* [SDWebImage](https://github.com/SDWebImage/SDWebImage) - An Asynchronous Image Downloader


### Support:
In case of any errors or app crashes please email me at:

Awais Akram ( [owaisakram103@gmail.com](owaisakram103@gmail.com) )


----


**Last Updated: 23.02.2020**
