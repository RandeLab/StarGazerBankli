// size in cm

logHeight = 110 ;
logDiam = 36 ;
backrestThickness = 6;
balkeThickness = 8;
backrestAngle = 20;

translate ([0,0,0]) rotate([90,90,0]) color("SaddleBrown") {bench();}
translate ([logDiam/2-5,0,logDiam/2+5]) rotate([90,backrestAngle,0]) color("SandyBrown") {backrest();}
translate ([logHeight/2-18,logHeight/2-logDiam/2,-logDiam+backrestThickness]) rotate([0,90,0]) color("Sienna") {base1();}
translate ([-18,-logHeight/2+logDiam/2,-logDiam+backrestThickness]) rotate([0,90,0]) color("Sienna") {base2();}

color("Grey") translate ([+logDiam/2+backrestThickness,-logHeight/2+logDiam/2,0]) rotate([0,backrestAngle,0]) balke();
color("Grey") translate ([+logDiam/2+backrestThickness,logHeight/2-logDiam/2,0]) rotate([0,backrestAngle,0]) balke();

color("Green") translate ([0,0,backrestThickness-logDiam]) rotate([0,0,0]) cube([logHeight*10,logHeight*10,1],center=true);

/*
translate ([0,0,0]) rotate([0,0,0]) color("SaddleBrown") {bench();}
translate ([-2,0,-1]) rotate([0,0,0]) color("Sienna") {base1();}
translate ([-2,0,1]) rotate([0,0,0]) color("Sienna") {base2();}
translate ([2,0,0]) rotate([0,0,0]) color("SandyBrown") {backrest();}
*/
module balke() { 
   cube([balkeThickness,balkeThickness,logHeight/2],center=true);
}


module bench() { 
difference (){
  cylinder( logHeight, d=logDiam, center=true, $fn=50 );
  translate ([20/2+logDiam/2-backrestThickness,0,0]) cube([20,logDiam+20,logHeight+20],center=true);
  translate ([-20/2,0,0]) cube([20,logDiam+20,logHeight+20],center=true);
  }
}

module backrest() { 
difference (){
  cylinder( logHeight, d=logDiam, center=true, $fn=50 );
  translate ([-logDiam/2+logDiam/2-backrestThickness,0,0]) cube([logDiam,logDiam+20,logHeight+20],center=true);
  }
}

module base1() { 
difference (){
  cylinder( logHeight, d=logDiam, center=true, $fn=50 );
  translate ([+20/2,0,0]) cube([20,logDiam+20,logHeight+20],center=true);
  translate ([-logDiam/2,0,logHeight/2+10]) cube([logDiam,logDiam+20,logHeight+20],center=true);
  }
}

module base2() { 
difference (){
  cylinder( logHeight, d=logDiam, center=true, $fn=50 );
  translate ([+20/2,0,0]) cube([20,logDiam+20,logHeight+20],center=true);
  translate ([-logDiam/2,0,-logHeight/2-10]) cube([logDiam,logDiam+20,logHeight+20],center=true);
  }
}