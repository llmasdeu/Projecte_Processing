/*
  p5tweets by Abe Pazos - 2013

  What is this?
    An experiment to find out how much can be done
    with programs that fit in a tweet (140 characters)

  How do they look like?
    Here you can see still images, but note that you
    will miss the animation:
    http://funprogramming.org/p5tweets

  Why do this?
    Because it's fun, addictive, difficult, and you often must
    break all rules of "good programming". Therefore, please
    don't learn programming from these tweets :)

  How to run them:
    1) Install Processing
    2) Download https://raw.github.com/hamoid/Fun-Programming/master/processing/ideas/2013/08/p5tweets/p5tweets.pde
    3) Open the downloaded file in Processing
    4) Uncomment a pair of lines
    5) Click run

    The first line in each pair of lines contains a name and an id.
    This is not part of the tweet. I use the id to save an image
    when I press the 's' key to easily share images with others.

    The second line in the pair is the tweet.
    
  Note:
    The p5tweets were originally written for Processing 2.
    Most are not compatible with Processing 3.

  Why are they commented out?
    Because I wanted to have them all in one file. If they were
    not commented out Processing would get confused with so many
    "void draw" found in this file.

  Find more p5tweets made by others:
    https://twitter.com/search?q=void%20OR%20size%20%23p5&src=savs&mode=realtime

  p5tweets Processing tool for easy download of tweets:
    https://forum.processing.org/topic/tweet-a-sketch#25080000002431089

  Make your own:
    At the end of the pde file there is a ruler you can use to make sure
    you don't go past the 140 characters limit :)

  Kudos
  To the ones who did this before (and still are doing it) with both SuperCollider
  and Processing.

*/

//int id=1; String name="random(1)*random(1)*random(1)"; String ext="png"; void setup() {
//size(800,800);for(int x=0;x<800;x++)if(x<800/2)line(x,0,x,random(1)*800);else line(x,0,x,random(1)*random(1)*random(1)*800);//#p5
//}

//int id=2; String name="RGB noise"; String ext="png";
//void draw(){loadPixels();int i=0;while(i<10000){pixels[i]=int(-random(1<<24));updatePixels();i++;}}//#p5 #processing

//int id=3; String name="Monitor kaputt"; String ext="png";
//void draw(){loadPixels();int i=0;while(i<9999){pixels[i]=-int(sin(i/(1+frameCount%250))*127+128)<<(frameCount%16);updatePixels();i++;}}//#p5

//int id=4; String name="RGB TV"; String ext="png";
//void draw(){loadPixels();int i=0;while(i<10000){pixels[i]=int(8*noise(frameCount+i)+.5)<<((frameCount+i)%24);updatePixels();i++;}}//#p5
// TODO: test why colors don't work on Processing 3. Negative values work, but colors are different.

//int id=5; String name="Flower"; String ext="png";
//void draw(){float m=millis()*.0003,r=89*sin(m*5.1)*noise(m);stroke(255,80);if(m<1)background(0);point(49+r*sin(m),49+r*cos(m));}//#p5

//int id=6; String name="Confused dot army"; String ext="png";
//int i,m;void draw(){background(i=0);stroke(255);m=millis();while(i<99){strokeWeight(((i/23.1+m/717.1)%30));point((i*i*m)%99,i++);}}//#p5

//int id=7; String name="Z line beam"; String ext="png";
//float i,m;void draw(){m=millis()*.001;background(i=0);stroke(255,99);while(i++<99){line(i*m%109,i*m%107,i*m%103,i*m%105);}}//#p5

//int id=8; String name="Color dancing dots"; String ext="png";
//int i,m;void draw(){background(i=0);m=millis();while(i<99){stroke(-m<<i);strokeWeight(((i/97.1+m/517.1)%30));point(i*i*m%99,i++);}}//#p5

//int id=9; String name="Circle transmitter"; String ext="png";
//float i,m;void draw(){background(i=0);noFill();while(i++<99){stroke(i*2,255-i*2,0,99);m=i*millis()*.001;ellipse(80,80,m%131,m%137);}}//#p5

//int id=10; String name="Pixellax"; String ext="png";
//void draw(){loadPixels();int c,i=0;while(i++<9999){c=125+millis()%(1+i)/79;pixels[i]=color(c,c-30,c-80);}updatePixels();}//#p5 #pixellax

//int id=11; String name="Planet"; String ext="jpg";
//int i=0;void setup(){size(900,900);}void draw(){fill(-1<<i%92,125);translate(450,450);rotate(i++);rect(i%333,0,i%33,5+i%10);}//#p5

//int id=12; String name="Circle city"; String ext="png";
//float i,j=0,m;void draw(){background(i=0);noFill();stroke(255,99);while(i++<99){m=i*j++*1e-4;ellipse(m*8%121,m*7%93,m%99,m%97);}}//#p5

//int id=13; String name="Planet Earth"; String ext="jpg";
//int i,j;void setup(){size(900,900);}void draw(){translate(450,840-i%380);fill(j=-(int)1e9<<i++%13);rotate(j-i);rect(i%380,0,40,40);}//#p5

//int id=14; String name="Numbers"; String ext="png";
//int i=900;void setup(){size(i,i);}void draw(){textSize(++i%878);fill(i%2*55+200);translate(450,450);rotate(i*.02);text(i/88&7,0,0);}//#p5

//int id=15; String name="Virus"; String ext="png";
//int i,w=300;void setup(){size(w,w);textSize(99);}void draw(){fill(i&255);text(++i%8,i*223%w,i*177%w);filter(11,3);filter(16);}//#p5

//int id=16; String name="Falling boxes"; String ext="png";
//int i;void setup(){size(600,600,P3D);};void draw(){translate(i%600,i*4%613);fill(-i<<7);rotate(i*.03,.2,.3,.7);box(i%99,i%79,i++%213);}//#p5

//int id=17; String name="LSD CPU"; String ext="jpg";
//int i=0,w=300;void setup(){size(w,300);};void draw(){while(++i%w!=0){stroke(i*i>>(i/w%9));line(i%w,i%w,i%(w+7),i%(w+6));}}//#p5

//int id=18; String name="Red friend"; String ext="jpg";
//int i,w=900;void setup(){size(w,w);}void draw(){fill(w,0,0,7);stroke(++i&255);bezier(i%w,0,i%(w+13),w/2,i/w*i%(w+33),w/2,i%(w+87),w);}//#p5

//int id=19; String name="Binary tunnel"; String ext="png";
//int i,s;void setup(){size(900,900);}void draw(){fill(--i<<-i);s=1<<-i%8;translate(300,600);rotate(i*.001);rect(s*(-i%5),s*(-i%7),s,s);}//#p5

//int id=20; String name="Asteroids"; String ext="png";
//int i,w=700;void setup(){size(w,w);clear();}void draw(){rect(200,mouseY,30,9);rect(w+i++%2*-20,random(w),7,7);copy(0,0,w,w,-2,0,w,w);}//#p5

//int id=21; String name="Boxed"; String ext="jpg";
//int i,w=900;void setup(){size(w,w,P3D);}void draw(){pointLight(w,0,0,w,w,w);translate(i*i%w,i*3%w);rotate(1,i*.1,i*.3,2);box(++i%99);}//#p5

//int id=22; String name="Some kind of order"; String ext="jpg";
//int i=0;void setup(){size(900,900);}void draw(){while(i++%99!=0){fill(i|i*i);translate(450,450);rotate(i);rect(i%333,0,i%33,5+i%10);}}//#p5

//int id=23; String name="Communication attempt"; String ext="jpg";
//int[]i=new int[4];int a,c;void setup(){size(900,900);}void draw(){stroke(a<<c);line(i[0],i[1],i[2],i[3]);i[a%4]=c=(a+i[++a%4]&a)%900;}//#p5

//int id=24; String name="38 seconds"; String ext="png";
//int s=900,i,w=s*s;void setup(){size(s,s);}void draw(){loadPixels();while(++i%w>0){pixels[i%w]=i%(s+i/s)-1<<(i/(w*90));}updatePixels();}//#p5

//int id=25; String name="Extended alphabet"; String ext="png";
//int i;void setup(){size(900,900);noStroke();}void draw(){while(++i%4>0){fill(-1<<(i%2<<4));rect(3+i%13*90,3+i%11*90,i*i%85,i*i%86);}}//#p5

//int id=26; String name="Fly like a fly"; String ext="png";
//float i;void setup(){size(900,900,P3D);}void draw(){translate(450,450);rotateY(i+=.017);rotateZ(i*.13);rect(200,200*sin(i*.87),90,90);}//#p5

//int id=27; String name="Binary noise"; String ext="png";
//int i,s=400,k=s*s;void setup(){size(s,s);}void draw(){while(++i%k>0)set(i%s,i/s%s,-i<<int(61*noise((i%s)/3e2,i*1e-8)));}//#p5

//int id=28; String name="Confronted with delay"; String ext="jpg";
//int i,n,s=900;void setup(){size(s,s);colorMode(3);}void draw(){fill(i%255,i%253,i%251,99);rotate(i);rect(i%s,n=(++i*7)%s,2e5/i,2e5/i);}//#p5

//int id=29; String name="Day and night of shuttered glass"; String ext="png";
//int i;void setup(){size(900,900,P3D);noFill();}void draw(){stroke(i%2*sin(i/9e2)*127+127);rotateX(++i/8e2);rotateZ(i/1e3);sphere(1e3);}//#p5

//int id=30; String name="Laser beans"; String ext="jpg";
//int n=900,s,a=n/2;void setup(){size(n,n);}void draw(){translate(a,a);rotate(++s/9e1);stroke(-(s*s)<<(s^-s));line(-n,s%n-a,n,s%n-a);}//#p5

//int id=31; String name="Eightyfour"; String ext="jpg";
//int n=900,s,a=n/2;void setup(){size(n,n,P3D);textSize(a);}void draw(){translate(a,a);rotateX(++s/8e1);fill(-s*n);text(84,s/7-a,s%n-a);}//#p5

//int id=32; String name="Surveillance"; String ext="jpg";
//int i,w=900;void setup(){size(w,w);}void draw(){fill(0,4);stroke(255,87);bezier(++i%w,w-(i%w),i/.23%w,i*7%w,i/.17%w,i/.3%w,i*6%w,w/2);}//#p5

//int id=33; String name="Stuck in a loop"; String ext="png";
//int i,w=900;void setup(){size(w,w,P3D);}void draw(){pointLight(w,w,w,w,0,2*w);camera(80,50,i%199,++i%96-50,i%93-50,0,0,1,0);box(i&69);}//#p5

//int id=34; String name="Glitch me"; String ext="png";
//int s=900,i,w=s*s;void setup(){size(s,s);}void draw(){loadPixels();while(++i%w>0){pixels[abs((i*7&i/s)%w)]=-(i/73)<<3;}updatePixels();}//#p5

//int id=35; String name="MYWC"; String ext="png";
//int i,s=450;void setup(){size(s*2,s*2,P3D);}void draw(){translate(s,s);rotate(--i*.1,i%9,i%7,i%4);fill((-7<<i%36)-1);rect(s,0,30,30);}//#p5

//int id=36; String name="Ministry of encryption"; String ext="png";
//int i,s=1024,r;void setup(){size(s,s);noStroke();}void draw(){r=8<<++i%6;fill(-(r<<(i/s))+(i%24)*r,270-r);rect(i/9*8%s,8*i*i*i%s,r,r);}//#p5

//int id=37; String name="Sea of int"; String ext="jpg";
//int i,n,s=900;void setup(){size(s,s);}void draw(){n=int(90+90*sin((i+=5)*.01));textSize(n);fill(233<<n);text(i/s,i%s-50,99*(i/s)%s-n);}//#p5

//int id=38; String name="Question"; String ext="png"; // NOTE: comment out the keyPressed for this one
//import javax.swing.JOptionPane;String r=JOptionPane.showInputDialog(null,"What?","Hmm..",JOptionPane.QUESTION_MESSAGE);text(r,9,9);//#p5

//int id=39; String name="Self mirror"; String ext="png"; void draw(){}
//void setup(){size(900,900);a(9);}void a(int n){if(n>0){fill(-n<<n);blendMode(4);ellipse(450,random(900),4<<n,4<<n);a(--n);a(n);}}//#p5

//int id=40; String name="Cloudless computing"; String ext="png";
//int s=900,i;void setup(){size(s,s,P3D);}void draw(){lights();fill(-i*s);translate(i%s,500);sphere(s/3);copy(0,i*i++%s,s,9,0,i*i*i%s,s,9);}//

//int id=41; String name="Only a game"; String ext="png";
//int s=900,i;void setup(){size(s,s,P3D);noStroke();}void draw(){lights();fill(-(i%3)*s<<17);translate(++i*i%s,i*i*i%s);sphere(s*s/i/5);}//#p5

//int id=42; String name="Answer to the ultimate Q of L, the U, and E"; String ext="jpg";
//int s=900,i;void setup(){size(s,s,P3D);noStroke();}void draw(){lights();fill(-i*i<<9);translate(s*noise(++i*.02),s-i*19%s);sphere(i%45);}//

//int id=43; String name="Rainbow after a hard day of work"; String ext="png";
//float i;void setup(){size(900,900,P3D);}void draw(){translate(450+450*cos(i*.9),600+400*sin(i+=.01)*noise(i));sphere(30/noise(i));}//#p5

//int id=44; String name="Orbit"; String ext="png";
//int i;void setup(){fullScreen(P3D);}void draw(){translate(i%900,600);rotateX(++i*.01);rotateZ(i*.019);translate(700,0);sphere(9);}//#p5

//int id=45; String name="Barbwire"; String ext="png";
//int i;void setup(){fullScreen();noStroke();}void draw(){translate(i*3%width,i*7%height);fill(i%90*3);rotate(++i);rect(0,0,i%90,i%89);}//#p5

//int id=46; String name="Fake"; String ext="jpg";
//int i;void setup(){size(900,900);}void draw(){translate(i%900,450);blendMode(2+i%2);rotate(i++);rect(i/20,0,400,i%20);fill(i);}//#p5

//int id=47; String name="Complicated trip to a beautiful place"; String ext="jpg";
//int j;void setup(){size(900,900);}void draw(){PImage i=get();filter(INVERT);rotate(sin(j*.01));image(i,j++%450,-(j%133)/10);}//#p5

//int id=48; String name="Negating is creating"; String ext="png";
//int j;void setup(){size(900,900);frameRate(2);}void draw(){filter(INVERT);tint(++j%255,30,0);rotate(sin(j));image(get(),j*9%500,j%90);}//#p5

//int id=49; String name="Music"; String ext="png";
//int i=1,s=900;void setup(){size(s,s);}void draw(){for(loadPixels();i++%(s*32)>0;)pixels[i*7%(s*s)]=-i*(i>>19)/s<<i/s/s;updatePixels();}//#p5

//int id=50; String name="LHC"; String ext="png";
//int i;void setup(){size(900,900,P3D);}void draw(){while(++i%900>0){translate(550,550);rotateX(i/6);rotateY(i/7);ellipse(400,0,20,20);}}//#p5

//int id=51; String name="a"; String ext="png";
//int i,s=900;void setup(){size(s,s,P3D);}void draw(){while(++i%8192>0){stroke(i/90210%256);point(i*(i+(i>>16))%s,i/6502%s,i/1117%s);}}//#p5 

// Ruler. 140 characters long. I develop new tweets under it.
/////-----/////---20/////-----/////---40/////-----/////---60/////-----/////---80/////-----/////--100/////-----/////--120/////-----/////--140


void keyPressed() {
  if(key=='s')
    save(id + "." + ext);
}