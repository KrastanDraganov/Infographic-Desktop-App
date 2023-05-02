import processing.sound.*;

PFont fontRegular;
PFont fontMedium;
PFont fontBold;

PImage graphicSolarPanel;
PImage graphicHouse;
PImage graphicElements;
PImage graphicFunction;
PImage graphicStructure;
PImage graphicQuiz;
PImage buttonPrevious;
PImage buttonNext;
PImage buttonMoreInfo;
PImage soundOn;
PImage soundOff;

SoundFile [] audioInfographic;

color defaultTextColor = #FFFFFF;
color buttonColor = #FB8500;

Navigation navigation;
Infografik infographic;
Startseite landingPage;
Quiz quiz;

void setup() {
  size(1100, 752);
  smooth();
  frameRate(60);
  noStroke();
  
  fontRegular = loadFont("Montserrat-Regular-48.vlw");
  fontMedium = loadFont("Montserrat-Medium-48.vlw" );
  fontBold = loadFont("Montserrat-SemiBold-48.vlw");
  
  graphicSolarPanel = loadImage("img/SolarPanel.png");
  graphicHouse = loadImage("img/House.png");
  graphicElements = loadImage("img/Elements.png");
  graphicFunction = loadImage("img/Function.png");
  graphicStructure = loadImage("img/Structure.png");
  graphicQuiz = loadImage("img/Quiz.png");
  
  buttonPrevious = loadImage("img/ArrowPrevious.png");
  buttonNext = loadImage("img/ArrowNext.png");
  
  buttonMoreInfo = loadImage("img/MoreInfo.png");
  soundOn = loadImage("img/volumeON.png");
  soundOff = loadImage("img/volumeOFF.png");
  
  audioInfographic = new SoundFile[5];
  audioInfographic[0] = new SoundFile(this, "audio/Part1.wav");
  audioInfographic[1] = new SoundFile(this, "audio/Part2.wav");
  audioInfographic[2] = new SoundFile(this, "audio/Part3.wav");
  audioInfographic[3] = new SoundFile(this, "audio/Part4.wav");
  audioInfographic[4] = new SoundFile(this, "audio/Part5.wav");
  
  navigation = new Navigation();
  infographic = new Infografik();
  landingPage = new Startseite();
  quiz = new Quiz();
}

void draw() {
  background(#FFFFFF);
  
  navigation.drawAllTabs();
  navigation.drawCurrentWindow();
  
  navigation.checkIfHovered();
}

void mousePressed() {
  navigation.checkIfSelected();
  
  if (tabNames[navigation.selectedTab].equals("Infografik")) {
    if (infographic.checkIfButtonPreviousSelected()) {
      infographic.decrementInfographic();
    }
    
    if (infographic.checkIfButtonNextSelected()) {
      infographic.incrementInfographic();
    }
    
    if (infographic.checkIfSoundIconSelected()) {
      infographic.changeSound();
    }
    
    if (infographic.checkIfVolumeSliderSelected()) {
      infographic.isSliderSelected = true;
      infographic.prevMouseX = mouseX;
    }
  }
  
  if (tabNames[navigation.selectedTab].equals("Quiz")) {
    if (quiz.checkIfDownButtonSelected()) {
      if (quiz.currentQuestion == START_SCREEN || quiz.currentQuestion == END_SCREEN) {
        quiz.startNewQuiz();
      } else {
        quiz.calculateResult();
      }
    }
    
    if (quiz.currentQuestion != START_SCREEN && quiz.currentQuestion != END_SCREEN) {
      if (quiz.checkIfButtonPreviousSelected()) {
        quiz.decrementQuestion();
      }
      
      if (quiz.checkIfButtonNextSelected()) {
        quiz.incrementQuestion();
      }
    }
    
    if (quiz.currentQuestion == 1 && quiz.determineSelectedCheckBox() != NO_CHECKBOX) {
      quiz.question1UserAnswer = quiz.determineSelectedCheckBox();
    }
    
    if (quiz.currentQuestion == 2) {
      quiz.isTextField1Selected = quiz.checkIfTextField1Selected();
      quiz.isTextField2Selected = quiz.checkIfTextField2Selected();
    }
  }
}

void mouseReleased() {
  if (tabNames[navigation.selectedTab].equals("Infografik")) {
    if (infographic.isSliderSelected) {
      infographic.isSliderSelected = false;
    }
  }
}

void keyPressed() {
  if (tabNames[navigation.selectedTab].equals("Infografik") && key == CODED) {
    if (keyCode == LEFT) {
      infographic.decrementInfographic();
    } else if (keyCode == RIGHT) {
      infographic.incrementInfographic();
    }
  }
    
  if (tabNames[navigation.selectedTab].equals("Quiz")) {
    if (quiz.currentQuestion != START_SCREEN && quiz.currentQuestion != END_SCREEN && key == CODED) {
      if (keyCode == LEFT) {
        quiz.decrementQuestion();
      } else if (keyCode == RIGHT) {
        quiz.incrementQuestion();
      }
    }
    
    if (quiz.currentQuestion == 2) {
      if (quiz.isTextField1Selected) {
        if (key == BACKSPACE) {
          if (quiz.question2UserAnswer1.length() != 0) {
            quiz.question2UserAnswer1 = quiz.question2UserAnswer1.substring(0, quiz.question2UserAnswer1.length() - 1); 
          }
        } else if (key == ESC || key == ENTER) {
          quiz.isTextField1Selected = false;
        } else if (key != CODED) {
          quiz.question2UserAnswer1 += key;
        }
      }
      
      if (quiz.isTextField2Selected) {
        if (key == BACKSPACE) {
          if (quiz.question2UserAnswer2.length() != 0) {
            quiz.question2UserAnswer2 = quiz.question2UserAnswer2.substring(0, quiz.question2UserAnswer2.length() - 1); 
          }
        } else if (key == ESC || key == ENTER) {
          quiz.isTextField2Selected = false;
        } else if (key != CODED) {
          quiz.question2UserAnswer2 += key;
        }
      }
    }
  }
}
