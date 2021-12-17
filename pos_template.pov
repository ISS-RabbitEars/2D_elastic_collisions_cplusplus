#include "colors.inc"

background{color Black}

#declare sy=100;
#declare sx=(4/3)*sy;
#declare cz=210;

camera{
    location <0,0,cz>
    look_at <0,0,0>
    right <-4/3,0,0>
    sky<0,0,1>
}

light_source {<0,0,cz> color White}

#fopen ndt "N.dat" read
#read(ndt,temp)
#declare N=temp;


#declare r=array[N];
#declare rs=array[N];

#fopen Rsd "rs.dat" read
#declare i=0;
#while (defined(Rsd))
    #read(Rsd,rs1)
    #declare rs[i]=rs1;
    #declare i=i+1;
#end

#fopen Pts "temp.dat" read
#declare i=0;
#while (defined(Pts))
    #read(Pts,vec1)
    #declare r[i]=vec1;
    #declare i=i+1;
#end

#declare j=0;
#while(j < i)
sphere {
  r[j] , rs[j]
  pigment { color Red }
}
    #if (r[j].x-rs[j]<-sx)
    sphere {
        <r[j].x+2*sx,r[j].y,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].x+rs[j]>sx)
    sphere {
        <r[j].x-2*sx,r[j].y,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].y-rs[j]<-sy)
    sphere {
        <r[j].x,r[j].y+2*sy,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].y+rs[j]>sy)
    sphere {
        <r[j].x,r[j].y-2*sy,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].x-rs[j]<-sx & r[j].y-rs[j]<-sy)
    sphere {
        <r[j].x+2*sx,r[j].y+2*sy,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].x-rs[j]<-sx & r[j].y+rs[j]>sy)
    sphere {
        <r[j].x+2*sx,r[j].y-2*sy,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].x+rs[j]>sx & r[j].y-rs[j]<-sy)
    sphere {
        <r[j].x-2*sx,r[j].y+2*sy,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
    #if (r[j].x+rs[j]>sx & r[j].y+rs[j]>sy)
    sphere {
        <r[j].x-2*sx,r[j].y-2*sy,r[j].z>, rs[j]
        pigment { color Red }
    }
    #end
#declare j=j+1;
#end

