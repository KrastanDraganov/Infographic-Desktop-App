//Introduction text
String introduction = "In der Infografik können Sie anhand von interaktiven Grafiken und begleitendem Text erfahren, was eine Solarzelle ist, wie sie funktioniert und wie sie aufgebaut ist. Abschließend können Sie Ihr neu erworbenes Wissen in einem kurzen Quiz testen, indem Sie auf 'Quiz' klicken.";
String headingStartseite = "Einführung";
String autor = "Teodora Draganova  | Infografik Solarzelle | \nInteraktive Werkzeuge | Prof. Ralph Tille "; 

public class Startseite {
  void displayLandingPage() {
    //Text background
    fill(#219EBC);
    rect(247, 141, 693, 405, 100);
    
    //Image solar panel
    image(graphicSolarPanel, 125, 250, 330, 330);
    
    //Heading
    fill(defaultTextColor);
    textAlign(LEFT, TOP);
    textFont(fontBold);
    textSize(22);
    text(headingStartseite, 445, 200);
    
    //Text
    textFont(fontRegular);
    textSize(20);
    text(introduction, 445, 233, 440, 180);
    
    //Autor
    textFont(fontMedium);
    textSize(20);
    text(autor, 445, 436);
  }
}
