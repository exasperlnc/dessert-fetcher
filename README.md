# Project Summary

Hello! I'm Logan, a SWE in Austin Texas. I've built a few apps like this one, but this is my first time checking out swift. I have a few different ideas listed for things I would like to add or update, take a look!

## Categories: 

### Testing

TDD: I have traditionally used TDD to help me get my project running, I find tests to be an excellent way to get immediate feedback on how my code is working, and it was very useful in ensuring my requests and Models were all working as intended. 

UI testing: I didn't have time to do UI testing that wasn't manual, but if I had more time this would be one of my top priorities.

Happy/Sad path testing: another good extension, and something I would do with more time to work. 

Coverage: Too low for my taste.

### Models

Recipe Model: Current ingredientsAndMeasurements function is satisfactory, but with more time I would like to simply save the ingredient and measure Data together after the API call instead of reformatting it in the View. 


![Screenshot 2024-07-18 at 10 43 58 AM](https://github.com/user-attachments/assets/ccf02bda-5a8d-451c-abc4-74fa6daa63f7)

### Service/Utilities

Convention: Not sure if the convention is to have both a Service and a Utility, could make a reasonable case that this is currently over-abstracted. 

Async/Await: This method of concurrency gave me some trouble with error handling, I chalk it up to lack of experience with Swift and would love feedback on how to get this to work.

### Views

isLoading: Originally had this so I could show a ProgressView when still waiting for the calls, but whenever I had this feature enabled the app would stay on the progress view and not update when the call was made.


![Screenshot 2024-07-18 at 10 41 33 AM](https://github.com/user-attachments/assets/aa9ac677-d73d-4555-9fb2-6bb3e53bcf2f)


Recipe View: The recipe.strMeasure attributes are sometimes in the Imperial system (ounces, teaspoons, etc) and sometimes in grams. Would be good in future to either convert them all to the same measurement system with a function at the Model level, or to allow users to select an Imperial or Metric View and allow the ViewModel to toggle between different ways of displaying the Data.


![Screenshot 2024-07-18 at 10 51 51 AM](https://github.com/user-attachments/assets/77a1dada-0023-4133-8b2d-c91d9e14f5d6)

   
