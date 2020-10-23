////A bag of cookies holds 30 cookies. The calorie information on the bag claims there are 10 “servings” in the bag and that a serving equals 300 calories. Write a program that asks the user to input how many cookies he or she actually ate, then reports how many total calories were consumed.
let NUM_OF_COOKIES_IN_BAG = 30;
let NUM_OF_SERVINGS_IN_BAG = 10;
let NUM_CALS_PER_SERVING = 300;
let CALS_PER_COOKIE = (NUM_CALS_PER_SERVING * NUM_OF_SERVINGS_IN_BAG) / NUM_OF_COOKIES_IN_BAG;

func greet() {
    print("How Many cookies did you eat?")
    if let numCookiesEaten = (Int)(readLine()!) {
      print("Calories consumed: ", numCookiesEaten * CALS_PER_COOKIE)
  } else {
      print("Please enter a valid number! I'm going to keep asking until you do.");
      greet()
  }
}
greet()