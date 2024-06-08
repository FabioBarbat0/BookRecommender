# BookRecommender

BookRecommender is an app, that helps book readers to choose their next
books to read. Basically, this app has two main features:
1. Based on the user’s tastes, the system will recommend other books
through a trained machine learning model;
2. The user can select the recommended books to see their description and
their preview, so that they can easily understand if the plot and the style
of the book are among the user’s tastes.

## Description

### ML Model
The machine learning model is based on collaborative filtering and it was created by CreateML, a powerful framework
of Apple that make easy the creation of a trained model. In fact, in this case,
it was enough to give a small dataset. Check it out [**Dataset file**](./Dataset.csv).
The model was managed with CoreML. See [**Recommender file**](./BookRecommender/BookRecommender/ViewModel/Recommender.swift) for details.

### Google Books API
To have the description of a book and (if it’s available) its preview, it was used Google Books API. With public searches it's not even need an API key.
It was managed through the [**BookJSON file**](./BookRecommender/BookRecommender/ViewModel/BookJSON.swift). You can find the struct of the book to decode the JSON and its function.
The function ```loadData(isbn: String)``` will send the request to Google Books' servers to fetch book informations. It will return its description and its webReader link to see the preview.


### Database
Since the dataset is small, the database containing the books informations
(link of the cover image, ISBN, name) is local, making faster the loading of
the informations. Check it out [**BookDB file**](./BookRecommender/BookRecommender/Model/BookDB.swift).
The database is loaded when the app starts to run. See [**BookRecommenderApp file**](./BookRecommender/BookRecommender/BookRecommenderApp.swift).


## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
