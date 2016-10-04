# README

This is a sample test app to fetch product data from the Walmart site and store it in the DB.
This also fetches the reviews for the product and associates it with the product.

[Working application can be found here](https://walmart-reviewer.herokuapp.com/)

What's missing and should be done in proper production app:
* Better test coverage
* Possibly add some integration tests
* Caching
* Some refactoring is required (creation of separate classes for some jobs that are currently not separated)
* Move to using I18n instead of using hard coded strings
* Separate some views in to partials
* Possibly separate the backend process to a separate API based app.
