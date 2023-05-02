int NO_CHECKBOX = -1;
int START_SCREEN = 0;
int END_SCREEN = 3;

String buttonStartText = "Neu starten";
String buttonEndText = "Abgeben";

String testIntoText = "In diesem Quiz können Sie Ihr neues Wissen aus der Infografik Solarzellen schnell überprüfen. Wenn Sie mit Ihrem Ergebnis am Ende nicht zufrieden sind, können Sie das Quiz jederzeit über die Schaltfläche 'Neu Starten' wiederholen.";
String testEndText = "Das haben Sie gut gemacht! Wenn Sie mit Ihrem Ergebnis nicht zufrieden sind, können Sie die Informationen erneut lesen und den Test erneut durchführen. Sie haben es geschafft, die Gesamtzahl zu erreichen: ";
String timeUpText = "Ihre Zeit ist abgelaufen. Wenn Sie mit Ihrem Ergebnis nicht zufrieden sind, können Sie die Informationen erneut lesen und den Test erneut durchführen. Sie haben es geschafft, die Gesamtzahl zu erreichen: ";

int allQuestions = 2;
String headingQuestion1 = "Frage 1";
String question1 = "Welcher Halbleiter wird am häufigsten für dieHerstellung von Solarzellen verwendet?";
String [] question1Options = {"Selen", "Silizium", "Bohr"};
String question1Option1 = "Selen";
String question1Option2 = "Silizium";
String question1Option3 = "Bohr";
int question1AnswerKey = 1;

int allCheckBoxes = 3;
int checkBoxSide = 45;
int checkBoxX = 479;
int [] checkBoxY = {301, 370, 440};

String headingQuestion2 = "Frage 2";
String question2 = "Füllen Sie jede Lücke mit einem Wort aus.";
String question2Text = "Fällt nun\n\nauf die Siliziumscheibe, werden\n\n\nfreigesetzt.";
String question2AnswerKey1 = "licht";
String question2AnswerKey2 = "elektronen";    

public class Quiz {
  int currentQuestion;
  
  int startTime, timeLimit;
  boolean exceededTime;
  
  int question1UserAnswer;
  String question2UserAnswer1, question2UserAnswer2;
  int result;
  
  boolean isTextField1Selected, isTextField2Selected;
  
  Quiz() {
    currentQuestion = START_SCREEN;
    timeLimit = 90000; // 90000 miliseconds = 90 seconds = 1 minute and 30 seconds
    question1UserAnswer = -1;
    question2UserAnswer1 = "";
    question2UserAnswer2 = "";
    result = 0;
    exceededTime = false;
    isTextField1Selected = false;
    isTextField2Selected = false;
  }
  
  //Text background
  void displayCurrentWindow() {
    if (currentQuestion != START_SCREEN && currentQuestion != END_SCREEN && getCurrentTime() >= timeLimit) {
      exceededTime = true;
      calculateResult();
    }
    
    if (currentQuestion == START_SCREEN) {
      displayTestIntroduction();
    }
    
    if (currentQuestion == 1) {
      displayQuestion1();
    }
    
    if (currentQuestion == 2) {
      displayQuestion2();
    }
    
    if (currentQuestion == END_SCREEN) {
      if (exceededTime) {
        displayResult(timeUpText);
      } else {
        displayResult(testEndText);
      }
    }
  }
  
  void displayTestIntroduction(){
    displayTextBoxAndImage();
    displayDownButton(buttonStartText);
    
    //Text 
    textAlign(TOP, LEFT);
    textFont(fontMedium);
    textSize(22);
    text(testIntoText, 331, 198, 525, 162);
  }
  
  void displayQuestion1(){
    displayTextBoxAndImage();
    displayDownButton(buttonEndText);
    
    displayControlButtons();
    timerText();
    
    //Text
    fill(#FFFFFF);
    textAlign(TOP, LEFT);
    textFont(fontBold);
    textSize(22);
    text(headingQuestion1, 447, 194);
    
    textFont(fontMedium);
    textAlign(TOP, LEFT);
    textSize(20);
    text(question1, 445, 232, 440, 100);
    
    textSize(21);
    text(question1Option1, 556, 330);
    text(question1Option2, 556, 392);
    text(question1Option3, 556, 462);
    
    // Checkbox button
    fill(#FFFFFF);
    for (int i = 0; i < allCheckBoxes; ++i) {
      if (question1UserAnswer == i) {
        fill(#FB8500);
      } else {
        fill(#FFFFFF);
      }
      rect(checkBoxX, checkBoxY[i], checkBoxSide, checkBoxSide, 10);
    }
  }
  
  void displayQuestion2(){
    displayTextBoxAndImage();
    displayDownButton(buttonEndText);
    
    displayControlButtons();
    timerText();
    
    //Text
    fill(#FFFFFF);
    textAlign(TOP, LEFT);
    textFont(fontBold);
    textSize(22);
    text(headingQuestion2, 447, 194);
    
    textFont(fontMedium);
    textAlign(TOP, LEFT);
    textSize(20);
    text(question2, 445, 232, 440, 100);
    
    textFont(fontRegular);
    textSize(20);
    text(question2Text, 448, 300, 440, 202);
    
    //Text fields
    fill(#FFFFFF);
    stroke(#FB8500); //when selected
    strokeWeight(3);
    
    if (isTextField1Selected) {
      stroke(#FB8500);
    } else {
      noStroke();
    }
    rect(550, 293, 331, 29, 10);
    
    if (isTextField2Selected) {
      stroke(#FB8500);
    } else {
      noStroke();
    }
    rect(446, 380, 331, 29, 10);
    
    fill(#023047);
    textFont(fontRegular);
    textAlign(TOP, LEFT);
    textSize(20);
    text(question2UserAnswer1, 570, 300, 440, 202); //widthRect + 20, heightRect +8
    text(question2UserAnswer2, 466, 387, 440, 202); //widthRect + 20, heightRect +8
    
  }
  
  void displayResult(String text){
    displayTextBoxAndImage();
    displayDownButton(buttonStartText);
    
    //Text 
    textAlign(TOP, LEFT);
    textFont(fontMedium);
    textSize(22);
    text(text, 331, 198, 525, 162);
    
    //Test result
    textAlign(TOP, LEFT);
    textFont(fontBold);
    textSize(40);
    text(str(result) + " / 10 Punkte", 473, 360, 295, 38);
    
  }
  
  void displayTextBoxAndImage() {
    fill(#38A8C3);
    rect(247, 141, 693, 405, 100);
    
    //Image solar cell
    image(graphicQuiz, -48, 163, 500, 500);
  }
  
  void displayDownButton(String text){
    //Button Background
    fill(#FB8500);
    rect(469, 600, 250, 60, 20);
    
    //Button Text
    fill(#FFFFFF);
    textFont(fontMedium);
    textAlign(CENTER);
    textSize(24);
    text(text, 594, 635);
  }
  
  void displayControlButtons() {
    image(buttonPrevious, 151, 272,  45, 45);
    image(buttonNext, 992, 272, 45, 45);
  }
  
  int getCurrentTime() {
    return millis() - startTime;
  }
  
  int getSeconds(int currentTime) {
    return (currentTime / 1000) % 60;
  }
  
  int getMinutes(int currentTime) {
    return (currentTime / 1000) / 60;
  }
  
  void timerText(){
    //Button Text
    fill(#023047);
    textFont(fontMedium);
    textAlign(CENTER);
    textSize(36);
    
    int left_time = timeLimit - getCurrentTime();
    
    String minutes = "0" + str(getMinutes(left_time));
    String seconds = str(getSeconds(left_time));
    if (getSeconds(left_time) < 10) {
      seconds = "0" + seconds;
    }
    
    text(minutes + ":" + seconds, 594, 76);
  }
  
  int determineSelectedCheckBox() {
    for (int i = 0; i < allCheckBoxes; ++i) {
      if (mouseX >= checkBoxX && mouseX <= checkBoxX + checkBoxSide && mouseY >= checkBoxY[i] && mouseY <= checkBoxY[i] + checkBoxSide) {
        return i;
      }
    }
    
    return NO_CHECKBOX;
  }
  
  boolean checkIfTextField1Selected() {
    return mouseX >= 550 && mouseX <= 881 && mouseY >= 293 && mouseY <= 322; 
  }
  
  boolean checkIfTextField2Selected() {
    return mouseX >= 446 && mouseX <= 777 && mouseY >= 380 && mouseY <= 409; 
  }
  
  boolean checkIfDownButtonSelected() {
    return mouseX >= 469 && mouseX <= 710 && mouseY >= 600 && mouseY <= 660;
  }
  
  boolean checkIfButtonPreviousSelected() {
     return mouseX >= 151 && mouseX <= 196 && mouseY >= 272 && mouseY <= 317;
  }
  
  boolean checkIfButtonNextSelected() {
     return mouseX >= 992 && mouseX <= 1037 && mouseY >= 272 && mouseY <= 317;
  }
  
  void decrementQuestion() {
    --currentQuestion;
    if (currentQuestion < 1) {
      currentQuestion = allQuestions;
    }
  }
  
  void incrementQuestion() {
    ++currentQuestion;
    if (currentQuestion > allQuestions) {
      currentQuestion = 1;
    }
  }
  
  void startNewQuiz() {
    startTime = millis();
    question1UserAnswer = -1;
    question2UserAnswer1 = "";
    question2UserAnswer2 = "";
    result = 0;
    currentQuestion = 1;
    exceededTime = false;
    isTextField1Selected = false;
    isTextField2Selected = false;
  }
  
  void calculateResult() {
    if (question1UserAnswer == question1AnswerKey) {
      result += 4;
    }
    
    if (question2UserAnswer1.toLowerCase().equals(question2AnswerKey1)) {
      result += 3;
    }
    if (question2UserAnswer2.toLowerCase().equals(question2AnswerKey2)) {
      result += 3;
    }
    
    currentQuestion = END_SCREEN;
  }
}
