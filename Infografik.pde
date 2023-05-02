int angleDefault = -180;
int angleChange = 1;
int angleLimit = 180;
int ALL_RAYS = 8;
int rayDistance = 45;

String [] headings = {"Was ist eine Solarzelle?", 
                      "Wo werden Solarpanelle\nbenutzt?",
                      "Wie funktionieren\nSolarzellen?",
                      "Wie funktionieren\nSolarzellen?",
                      "Wie ist die Solarzelle in \nSchichten aufgebaut? "};

String [] infoText = {"Eine Solarzelle wandelt die Strahlungsenergie der Sonne (Sonnenlicht) in elektrische Energie um. Sie ist somit ein elektrisches Bauelement. Die Umwandlung von Sonnenlicht in Strom mithilfe von Solarzellen ist auch als Photovoltaik bekannt.\n\nEs existieren viele verschiedene Zelltypen, die sowohl nach dem verwendeten Halbleitermaterial als auch nach der Zelltechnologie unterschieden werden können. Wichtigstes Halbleitermaterial ist Silicium, aus dem im Jahr 2013 etwa 90 % aller weltweit hergestellten Solarzellen gefertigt wurden.",
                      "Zur Energiewandlung wird der photoelektrische Effekt von Solarzellen genutzt, die ihrerseits wiederum zu so genannten Solarmodulen verbunden werden. Die erzeugte Elektrizität kann direkt genutzt, in Stromnetze eingespeist oder in Akkumulatoren gespeichert werden. Das System aus Solarmodulen und den anderen Bauteilen wird als Photovoltaikanlage bezeichnet.\n\nUm herauszufinden, welche Bauteilen der Photovoltaikanlage sich wo befinden, bewegen Sie den Mauszeiger über die Fragezeichen.",
                      "In einer Solarzelle wird ein Halbleitermaterial eingesetzt, da Halbleiter bei Energiezufuhr über eine verbesserte Leitfähigkeit verfügen. Bei Lichteinfall, erhöht sich somit die Leitfähigkeit der Zelle, Elektronen bewegen sich und es entsteht Strom. Nahezu 95 Prozent aller Solarzellen werden aus dem Quarzsand Silizium (Si) hergestellt.\n\nSilizium (Si) stellt eins der häufigsten natürlichen in der Erdschicht vorhandenen Elemente dar. Silizium gilt als unerschöpflich. Um aus dem Quarzsand – natürlicher Ursprung von Silizium – eine Siliziumscheibe zu formen muss der Quarzsand zunächst gereinigt und kristallisiert werden.",
                      "Fällt nun Licht auf die Siliziumscheibe, werden Elektronen freigesetzt. Um diese Elektronen nutzen zu können muss die Ober- und Unterseite einer jeden einzelnen Zelle mit unterschiedlichen Fremdatomen gezielt verunreinigt werden. \n\nDank der gezielten Verunreinigung der Zelle sammeln sich die Elektronen auf der einen Seite und die Protonen auf der anderen Seite. Auf diese Art und Weise entstehen ein Plus- und ein Minuspol, welcher mit einer Batterie vergleichbar ist. Wird im Nachgang ein Verbrauchsgerät angeschlossen fließt der Strom.",
                      "Der Aufbau einer Solarzelle besteht aus zwei Elektroden – die Kontakte – umschließen ein Paket aus drei verschiedenen Halbleiterschichten. Die obere Elektrode ist lichtdurchlässig, damit die Lichtteilchen bis in die Halbleiterschichten durchdringen. Die untere Elektrode kann Lichtteilchen, zurück in die Halbleiterschichten reflektieren. \n\nEine Glasschicht schützt die Solarzelle. Das Halbleiter-Sandwich im Inneren der Solarzelle besteht aus einer undotierten i-Schicht in der Mitte, die zwei unterschiedlich dotierte Schichten miteinander verbindet: die sogenannte n- und die p-dotierte Schicht."};

int allMoreInfoButtons = 5;
int moreInfoButtonSide = 34;
int [] moreInfoButtonsX = {324, 223, 282, 340, 406};
int [] moreInfoButtonsY = {165, 395, 325, 403, 501};
String [] moreInfoButtonsText = {"Photovoltaik Module", "Wechselrichter", "Einspeisezähler", "Elektrische Verbraucher", "Öffentliches Stormnetz"};
int NO_MORE_INFO_BUTTON = -1;

public class Infografik {
  int currentInfographic;
  int allInfographics;
  
  int scrollBarX, scrollBarY, scrollBarLength;
  int sliderX, sliderY, sliderLength, sliderMinLimit, sliderMaxLimit;
  
  boolean isAudioMuted;
  
  int prevMouseX;
  boolean isSliderSelected;
  
  Infografik() {
    currentInfographic = 0;
    allInfographics = 5;
    
    scrollBarX = 350;
    scrollBarY = 35;
    scrollBarLength = 200;
    
    sliderX = 475;
    sliderY = 27;
    sliderLength = 30;
    
    sliderMinLimit = scrollBarX - (sliderLength / 2);
    sliderMaxLimit = scrollBarX + scrollBarLength - (sliderLength / 2);
    
    isAudioMuted = false;
    isSliderSelected = false;
  }
  
  void displayCurrentInfographic() {
    switch(currentInfographic) {
      case 0:
        displayPart1();
        break;
      
      case 1:
        displayPart2();
        break;
      
      case 2:
        displayPart3();
        break;
        
      case 3:
        displayPart4();
        break;
        
      case 4:
        displayPart5();
        break;
    }
    
    dipslayInfoBox();
    displayControlButtons();
    displaySoundButtons();
  }
  
  void displayPart1() {
    sunAnimation();
    
    //Graphic solar panel
    imageMode(CORNER);
    image(graphicSolarPanel, 190, 130, 450, 450);
  }
  
  void displayPart2(){
    //Graphic House
    imageMode(CORNER);
    image(graphicHouse, 190, 100, 500, 500);
    
    for (int i = 0; i < allMoreInfoButtons; ++i) {
      image(buttonMoreInfo, moreInfoButtonsX[i], moreInfoButtonsY[i], moreInfoButtonSide, moreInfoButtonSide); //Photovoltaik Module
    }
    
    displayMoreInfo();
  }
  
  void displayPart3(){
    //Graphic House
    imageMode(CORNER);
    image(graphicElements, 190, 130, 450, 450);
  }
  
  void displayPart4() {
    //Graphic House
    imageMode(CORNER);
    image(graphicFunction, 140, 100, 550, 550);
  }
  
  void displayPart5() {
    //Graphic House
    imageMode(CORNER);
    image(graphicStructure, 100, 50, 600, 600);
  }
  
  void dipslayInfoBox() {
    //Text background
    fill(#219EBC);
    rect(752, 0, 470, 752, 100);
    
    //Heading
    fill(defaultTextColor);
    textAlign(LEFT, TOP);
    textFont(fontBold);
    textSize(22);
    text(headings[currentInfographic], 795, 45);
    
    textAlign(LEFT, TOP);
    textFont(fontRegular);
    textSize(18);
    text(infoText[currentInfographic], 795, 107, 270, 535);
  }
  
  void displayControlButtons() {
    image(buttonPrevious, 244, 678, 45, 45);
    image(buttonNext, 530, 678, 45, 45);

    fill(#023047);
    textAlign(LEFT, TOP);
    textFont(fontMedium);
    textSize(45);
    
    text(str(currentInfographic + 1) + "/5", 383, 682);
  }
  
  void displaySoundButtons() {
    if (isSliderSelected) {
      sliderX += (mouseX - prevMouseX);
      sliderX = constrain(sliderX, sliderMinLimit, sliderMaxLimit);
      prevMouseX = mouseX;
    }
    
    fill(#023047);
    rect(scrollBarX, scrollBarY, scrollBarLength, 14, 10);
    
    int volumeBarLength = sliderX + (sliderLength / 2) - scrollBarX;
    float volume = (float) volumeBarLength / (float) scrollBarLength;
    audioInfographic[currentInfographic].amp(volume);
    
    fill(#38A8C3);
    rect(scrollBarX, scrollBarY, volumeBarLength, 14, 10);
    
    fill(#FB8500);
    rect(sliderX, sliderY, sliderLength, sliderLength, 10);
    
    if (isAudioMuted) {
      if (audioInfographic[currentInfographic].isPlaying()) {
        audioInfographic[currentInfographic].stop();
      }
      
      image(soundOff, 270, 23, 45, 45);
    } else {
      if (!audioInfographic[currentInfographic].isPlaying()) {
        audioInfographic[currentInfographic].loop();
      }
      
      image(soundOn, 270, 23, 45, 45);
    }
  }
  
  void sunAnimation() {
    //Sun rays
    pushStyle();
    stroke(#FFB703);
    strokeWeight(2);
    
    //Every sun beam is beeing put into a different matrix,
    //so that it can be rotated individually
    for (int ray = 0, angle = angleDefault; ray < ALL_RAYS; ++ray) {
      pushMatrix();
      translate(220, 120);
      rotate(radians(angle));
      line(0, 0, 100, 80);
      popMatrix();
      
      angle += rayDistance;
    }
    
    popStyle();
    
    angleDefault += angleChange;
    if(angleDefault > angleLimit){
      angleDefault -= angleLimit;
    }
    
    //Sun ellipse
    pushMatrix();
    fill(#FFB703);
    translate(220, 120);
    ellipse(0, 0, 80, 80); 
    popMatrix();
  }
  
  boolean checkIfButtonPreviousSelected() {
     return mouseX >= 244 && mouseX <= 289 && mouseY >= 678 && mouseY <= 723;
  }
  
  boolean checkIfButtonNextSelected() {
     return mouseX >= 530 && mouseX <= 575 && mouseY >= 678 && mouseY <= 723;
  }
  
  boolean checkIfSoundIconSelected() {
     return mouseX >= 270 && mouseX <= 315 && mouseY >= 23 && mouseY <= 68;
  }
  
  boolean checkIfVolumeSliderSelected() {
    return mouseX >= sliderX && mouseX <= sliderX + sliderLength && mouseY >= sliderY && mouseY <= sliderY + sliderLength;
  }
  
  void decrementInfographic() {
    if (audioInfographic[currentInfographic].isPlaying()) {
      audioInfographic[currentInfographic].stop();
    }
    
    --currentInfographic;
    if (currentInfographic < 0) {
      currentInfographic = allInfographics - 1;
    }
  }
  
  void incrementInfographic() {
    if (audioInfographic[currentInfographic].isPlaying()) {
      audioInfographic[currentInfographic].stop();
    }
    
    ++currentInfographic;
    if (currentInfographic >= allInfographics) {
      currentInfographic = 0;
    }
  }
  
  void changeSound() {
    if (isAudioMuted) {
      isAudioMuted = false;
    } else {
      isAudioMuted = true;
    }
  }
  
  int determineHoveredMoreInfoButton() {
    for (int i = 0; i < allMoreInfoButtons; ++i) {
      if (mouseX >= moreInfoButtonsX[i] && mouseX <= moreInfoButtonsX[i] + moreInfoButtonSide 
          && mouseY >= moreInfoButtonsY[i] && mouseY <= moreInfoButtonsY[i] + moreInfoButtonSide) {
        
        return i;
      }
    }
    
    return NO_MORE_INFO_BUTTON;
  }
  
  void displayMoreInfo() {
    int currentButton = determineHoveredMoreInfoButton();
    
    if (currentButton == NO_MORE_INFO_BUTTON) {
      return;
    }
    
    //Textbox
    fill(#88CCDD);
    
    int textBoxX = moreInfoButtonsX[currentButton] + 33;
    int textBoxY = moreInfoButtonsY[currentButton] + 33;
    rect(textBoxX, textBoxY, 200, 25, 10); //width = WidthbuttonMoreInfo + 33, height = HeightbuttonMoreInfo + 33
    
    //Text in textbox
    fill(#023047);
    textAlign(LEFT);
    textFont(fontMedium);
    textSize(15);
    
    int textX = textBoxX + 13;
    int textY = textBoxY + 17;
    text(moreInfoButtonsText[currentButton], textX, textY); //width = 424 = widthTextBox + 67, height = 215 = heightTextBox + 17
  }
}
