PLYWIDTH=.75;
CUTWIDTH=1;
TABLEBOTTOM=20.5;
BASEWIDTH=18;
TOPWIDTH=24;
DRAWERHEIGHT=2.5;
TABLEDEPTH=32;
module tableSlat(position, slatColor, size, label){
    translate(position)
    color(slatColor)
    cube(size);
    if(size[0] > 1){
        echo(size[0] , slatColor, label);
    }
    else{
        echo(size[2] , slatColor, label);
    }
    
}
for(i=[0:TABLEDEPTH]){
        if(i % 2 == 0)
        {
            c= [0,0,1];
            VERTCOLOR=[0,1,0];
            //blues
            //table top
            tableSlat([1,i*.75,TABLEBOTTOM+DRAWERHEIGHT+CUTWIDTH], c, [TOPWIDTH-(2*CUTWIDTH),PLYWIDTH,CUTWIDTH], "table top");

            //upright end
            tableSlat([0,i*.75,TABLEBOTTOM+CUTWIDTH], VERTCOLOR, [CUTWIDTH,PLYWIDTH,DRAWERHEIGHT+CUTWIDTH], "upright end");
            tableSlat([TOPWIDTH-CUTWIDTH,i*.75,TABLEBOTTOM+CUTWIDTH], VERTCOLOR, [CUTWIDTH,PLYWIDTH,DRAWERHEIGHT+CUTWIDTH], "upright end");

            //upright drawer divider
            tableSlat([TOPWIDTH/2-CUTWIDTH/2,i*.75,TABLEBOTTOM+CUTWIDTH], VERTCOLOR, [CUTWIDTH,PLYWIDTH,DRAWERHEIGHT], "upright drawer divider");

            //drawer support
            tableSlat([0,i*.75,TABLEBOTTOM], c, [TOPWIDTH,PLYWIDTH,CUTWIDTH], "drawer support");
            
            if(i>TABLEDEPTH/3 && i < TABLEDEPTH)
            {
                //upright support
                tableSlat([TOPWIDTH/2-CUTWIDTH/2,i*.75,0], VERTCOLOR, [CUTWIDTH,PLYWIDTH,TABLEBOTTOM], "upright support");
                //botttom                
                tableSlat([(TOPWIDTH-BASEWIDTH)/2,i*.75,0], c, [BASEWIDTH/2-(CUTWIDTH/2),PLYWIDTH,CUTWIDTH], "bottom");
                tableSlat([TOPWIDTH/2+(CUTWIDTH/2),i*.75,0], c, [BASEWIDTH/2-(CUTWIDTH/2),PLYWIDTH,CUTWIDTH], "bottom");
            }
            else
            {
                //botttom
                tableSlat([(TOPWIDTH-BASEWIDTH)/2,i*.75,0], c, [BASEWIDTH,PLYWIDTH,CUTWIDTH], "bottom");
            }
        }
        else
        {
            c=[1,0,0];
            VERTCOLOR=[1,1,0];
            //reds

            //upright end
            tableSlat([0,i*.75,TABLEBOTTOM], VERTCOLOR, [CUTWIDTH,PLYWIDTH,DRAWERHEIGHT+CUTWIDTH], "upright end");
            tableSlat([TOPWIDTH-CUTWIDTH,i*.75,TABLEBOTTOM], VERTCOLOR, [CUTWIDTH,PLYWIDTH,DRAWERHEIGHT+CUTWIDTH], "upright end");

            if(i>TABLEDEPTH/3 && i < TABLEDEPTH)
            {
                
                //table top
                tableSlat([0,i*.75,TABLEBOTTOM+DRAWERHEIGHT+CUTWIDTH], c, [TOPWIDTH/2-CUTWIDTH/2,PLYWIDTH,CUTWIDTH], "table top");
                tableSlat([.5*TOPWIDTH+.5,i*.75,TABLEBOTTOM+DRAWERHEIGHT+CUTWIDTH], c, [TOPWIDTH/2-CUTWIDTH/2,PLYWIDTH,CUTWIDTH], "table top");
                //upright support
                tableSlat([TOPWIDTH/2-CUTWIDTH/2,i*.75,CUTWIDTH], VERTCOLOR, [CUTWIDTH,PLYWIDTH,TABLEBOTTOM+DRAWERHEIGHT+CUTWIDTH], "upright support");
            }
            else
            {
                //upright drawer divider
                tableSlat([TOPWIDTH/2-CUTWIDTH/2,i*.75,TABLEBOTTOM], VERTCOLOR, [CUTWIDTH,PLYWIDTH,3.5], "upright drawer divider");

                //table top
                tableSlat([0,i*.75,TABLEBOTTOM+DRAWERHEIGHT+CUTWIDTH], c, [TOPWIDTH,PLYWIDTH,CUTWIDTH], "table top");
            }
            //bottom
            tableSlat([(TOPWIDTH-BASEWIDTH)/2,i*.75,0], c, [BASEWIDTH,PLYWIDTH,CUTWIDTH], "bottom");        

    }
    
    //drawer
    maxiter = (DRAWERHEIGHT*10)-1;
    for(i =[0:maxiter]){
        //drawer fronts and backs
        if(i % 2 == 0)
        {
            //left front
            translate([CUTWIDTH, 0, TABLEBOTTOM + CUTWIDTH+.1*i])
            color([1,1,1])
            cube([TOPWIDTH/2-(1.5*CUTWIDTH), PLYWIDTH, .1]);

            //right front
            translate([TOPWIDTH/2+.5*CUTWIDTH, 0, TABLEBOTTOM + CUTWIDTH+.1*i])
            color([1,1,1])
            cube([TOPWIDTH/2-(1.5*CUTWIDTH), PLYWIDTH, .1]);
        }
        else
        {
            //left front
            translate([CUTWIDTH+PLYWIDTH, 0, TABLEBOTTOM + CUTWIDTH+.1*i])
            color([1,1,1])
            cube([TOPWIDTH/2-(1.5*CUTWIDTH)-2*PLYWIDTH, PLYWIDTH, .1]);
            
            //right front
            translate([TOPWIDTH/2+.5*CUTWIDTH+PLYWIDTH, 0, TABLEBOTTOM + CUTWIDTH+.1*i])
            color([1,1,1])
            cube([TOPWIDTH/2-(1.5*CUTWIDTH)-2*PLYWIDTH, PLYWIDTH, .1]);
            
        }
    }
}