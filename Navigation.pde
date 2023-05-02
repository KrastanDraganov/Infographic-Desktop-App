int NO_TAB = -1;
int ALL_TABS = 3;

int tabWidth = 90; //Tab width
int tabHeight = 250; //Tab height
int tabDistance = 1; //Distance between two tabs
int tabCurve = 20;

int tabX = -10;
int [] tabY = {0, 251, 502};

String [] tabNames = {"Startseite", "Infografik", "Quiz"};

int textX = 50; // (tabX + tabWidth) / 2
int [] textY = {125, 376, 627}; // tabY + (tabHeigth / 2)

color defaultColor = #023047;  //Color, when tabs are not hovered
color hoverColor = #219EBC;    //Color, when tabs are selected
color selectedColor = #FB8500; //Color, when Tabs are hovered
color textColor = #FFFFFF;

public class Navigation {
  int selectedTab;
  
  Navigation() {
    // When the app is started, it is on the first tab
    selectedTab = 0;
  }
  
  void drawAllTabs() {
    for (int tab = 0; tab < ALL_TABS; ++tab) {
      if (tab == selectedTab) {
        drawTab(tab, selectedColor);
      } else {
        drawTab(tab, defaultColor);
      }
    }
  }
  
  void drawTab(int tab, color usedColor) {
    fill(usedColor);
    noStroke();
    rect(tabX, tabY[tab], tabWidth, tabHeight, tabCurve);
    setTabText(tab);
  }
  
  void drawCurrentWindow() {
    switch (tabNames[selectedTab]) {
      case "Startseite":
        landingPage.displayLandingPage();
        break;
      
      case "Infografik":
        infographic.displayCurrentInfographic();
        break;
      
      case "Quiz":
        quiz.displayCurrentWindow();
        break;
      
      default:
        println("Selected Tab does not exist");
    }
  }
  
  void setTabText(int tab){
    fill(#FFFFFF);

    textSize(24);
    textAlign(CENTER, BOTTOM);

    pushMatrix();
    translate(textX, textY[tab]);
    rotate(-HALF_PI);
    text(tabNames[tab], 0, 0);
    popMatrix();
  }
  
  //Function that checks, which tab is beeing hovered
  int determineHoveredTab() {
    if (mouseX < tabX || mouseX > tabX + tabWidth) {
      return NO_TAB;
    }
    
    for (int tab = 0; tab < ALL_TABS; ++tab) {
      if (mouseY >= tabY[tab] && mouseY <= tabY[tab] + tabHeight) {
        return tab;
      }
    }
    
    return NO_TAB;
  }
  
  void checkIfHovered() {
    int hoveredTab = determineHoveredTab();
    
    if (hoveredTab == NO_TAB) {
      return;
    }
    
    drawTab(hoveredTab, hoverColor);
  }
  
  void checkIfSelected() {
    int hoveredTab = determineHoveredTab();
    
    if (hoveredTab == NO_TAB || hoveredTab == selectedTab) {
      return;
    }
    
    if (tabNames[selectedTab].equals("Infografik") && audioInfographic[infographic.currentInfographic].isPlaying()) {
      audioInfographic[infographic.currentInfographic].stop();
    }
    
    if (tabNames[selectedTab].equals("Quiz")) {
      quiz.currentQuestion = START_SCREEN;
    }
    
    drawTab(hoveredTab, selectedColor);
    selectedTab = hoveredTab;
  }
}
