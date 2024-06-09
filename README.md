# BookRecommender

BookRecommender is an iOS app, that helps book readers to choose their next
books to read. <br>Basically, this app has two main features:
1. Based on the user’s tastes, the system will recommend other books
through a trained machine learning model;
2. The user can select the recommended books to see their description and
their preview, so that they can easily understand if the plot and the style
of the book are among the user’s tastes.

## How to use
1. Rate the books you have read and tap *Continue*;
2. Select one of the recommended books;
3. Read the description and tap *Preview*;
4. Enjoy your reading!

## Description

### ML Model
The machine learning model is based on collaborative filtering and it was created by CreateML, a powerful framework
of Apple that make easy the creation of a trained model. In this case,
it was enough to give a small dataset. Check it out [**Dataset file**](./Dataset.csv).<br>
The model was managed with CoreML. See [**Recommender file**](./BookRecommender/BookRecommender/ViewModel/Recommender.swift) for details.

### Google Books API
To have the description of a book and (if it’s available) its preview, it was used Google Books API. With public searches it's not even need an API key.<br>
It was managed through the [**BookJSON file**](./BookRecommender/BookRecommender/ViewModel/BookJSON.swift). You can find the struct of the book to decode the JSON and its function.<br>
The function ```loadData(isbn: String)``` will send the request to Google Books' servers to fetch book informations. It will return its description and its webReader link to see the preview.


### Database
Since the dataset is small, the database containing the books informations
(link of the cover image, ISBN, name) is local, making faster the loading of
the informations. Check it out [**BookDB file**](./BookRecommender/BookRecommender/Model/BookDB.swift).<br>
The database is loaded when the app starts to run. See [**BookRecommenderApp file**](./BookRecommender/BookRecommender/BookRecommenderApp.swift).


## How it works
1. The first view is [**BookRatingView**](./BookRecommender/BookRecommender/Views/BookRatingView.swift) which loads books from database and shows them through a ```LazyVGrid``` in which each grid item is a [**BookView**](./BookRecommender/BookRecommender/Views/BookView.swift). The view instantiates a **Recommender** object. Once rated, when the button *Continue* is pressed, the Recommender's function ```load``` is called and every rating is taken and processed;
2. The next view is [**RecommendView**](./BookRecommender/BookRecommender/Views/RecommendView.swift) that shows recommended books by the ML model. Each grid item is a **BookView** with the boolean condition ```isRated=true``` so that the same view can be reused: rating stars are hidden and each book can be tapped to go to the next view;
3. When a recommended book is tapped, it appears [**BookDescriptionView**](./BookRecommender/BookRecommender/Views/BookDescriptionView.swift). In this view is possible to see the description of the tapped book and its preview, loaded from the function ```loadData(isbn: String)```.
4. Once pressed the button *Preview*, the app redirects to the book preview web page offered by Google Books;


## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
