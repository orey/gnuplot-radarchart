########################################################
# Customizable radar chart for gnuplot
# Author: Olivier Rey
# Email: rey.olivier@gmail.com
# Date: June 2019
# License: Apache 2
########################################################

unset border
set angle degrees
set polar
set grid polar 30
set grid ls 0.5

### Tics must be positive even in the negative area
myticspositif(x)=sprintf("%1.0f",x)
myticsnegatif(x)=sprintf("%1.0f",-x)

### Line styles
set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 2
set style line 2 linecolor rgb '#0060ad' linetype 1 linewidth 2
set style line 3 lc rgb 'black' pt 5   # square
set style line 4 lc rgb 'black' pt 7   # circle
set style line 5 lc rgb 'black' pt 9   # triangle

set style line 6 linecolor rgb 'blue' linetype 1 linewidth 2


set style line 10 lt 1 lc 0 lw 0.3
set style line 11 lt 1 lw 2 pt 2 ps 2 #set the line style for the plot

set style line 12 lc rgb '#0060ad' lt 1 lw 2 pt 7 pi -1 ps 1.5
set pointintervalbox 3

set style line 13 lc rgb 'orange' lt 1 lw 2 pt 7 pi -1 ps 1.5
set style line 14 lc rgb 'green' lt 1 lw 2 pt 7 pi -1 ps 1.5
set style line 15 lc rgb 'brown' lt 1 lw 2 pt 7 pi -1 ps 1.5

#set termoption dash

set style line 16 lt 3 lc rgb 'grey' lw 2 ps 0.3 #pt 7 pi -1 ps 0.2 

### Range of graph
notation = 5

margin = notation + .5

set xrange [-margin:margin]
set yrange [-margin:margin]

#in polar coordinates remove x axis !!!! and rtics !!!
unset raxis
unset rtics
set rtics 1
set rtics format ""

#unset xzeroaxis
#unset xtics
#set xtics format ""

set xtics axis
set ytics axis

### Set personal tics
#set xtics scale 0
set xtics (myticsnegatif(-5) -5,myticsnegatif(-4) -4,myticsnegatif(-3) -3,myticsnegatif(-2) -2,myticsnegatif(-1) -1,"" 0, \
myticspositif(1) 1,myticspositif(2) 2,myticspositif(3) 3,myticspositif(4) 4,myticspositif(5) 5)

#set ytics scale 0
set ytics (myticsnegatif(-5) -5,myticsnegatif(-4) -4,myticsnegatif(-3) -3,myticsnegatif(-2) -2,myticsnegatif(-1) -1,"" 0, \
myticspositif(1) 1,myticspositif(2) 2,myticspositif(3) 3,myticspositif(4) 4,myticspositif(5) 5)

set size square

set key lmargin

### Define the number of axes
axisnumber = 7

anglestep = 360/axisnumber
start = anglestep/2

### This places a label on the outside
set_label(x, text) = sprintf("set label '%s' at (margin*cos(start + %f*anglestep)), (margin*sin(start + %f*anglestep)) center", text, x, x)

### Here all labels are created
eval set_label(0, "Label01")
eval set_label(1, "Label02")
eval set_label(2, "Label03")
eval set_label(3, "Label04")
eval set_label(4, "Label05")
eval set_label(5, "Label06")
eval set_label(6, "Label07")

#eval set_label(7, "Label08")
#eval set_label(8, "Label09")
#eval set_label(9, "Label10")
#eval set_label(10, "Label11")
#eval set_label(11, "Label12")
#eval set_label(12, "Label13")
#eval set_label(13, "Label14")
#eval set_label(14, "Label15")
#eval set_label(15, "Label16")
#eval set_label(16, "Label17")
#eval set_label(17, "Label18")
#eval set_label(18, "Label19")
#eval set_label(29, "Label20")


#set style fill transparent solid 0.5 noborder
set style fill transparent pattern 4 bo

coordx(x) = notation*cos(start +x*anglestep)
coordy(x) = notation*sin(start +x*anglestep)

#set arrow 1 from 0,0 to (5*cos(start)),(5*sin(start)) nohead ls 16
set arrow 1 from 0,0 to coordx(0),coordy(0) nohead ls 16
set arrow 2 from 0,0 to coordx(1),coordy(1) nohead ls 16
set arrow 3 from 0,0 to coordx(2),coordy(2) nohead ls 16
set arrow 4 from 0,0 to coordx(3),coordy(3) nohead ls 16
set arrow 5 from 0,0 to coordx(4),coordy(4) nohead ls 16
set arrow 6 from 0,0 to coordx(5),coordy(5) nohead ls 16
set arrow 7 from 0,0 to coordx(6),coordy(6) nohead ls 16

####################Individual estimation#################################
#set terminal png nocrop enhanced size 1000,600 font "arial,8"
set terminal png font "arial,8"
set output 'sample1.png'
set title "Spider Chart for Sample 1" font "arial,14"

plot 'sample1.dat' using 2:3 with filledcurves closed notitle, \
     'sample1.dat' using 2:3 title "Sample 1 legend" with linespoints ls 12, \
     3 notitle with lines linestyle 1, \
     5 notitle with lines linestyle 2
       
####################Individual estimation#################################
#set terminal png nocrop enhanced size 1000,600 font "arial,8"
set terminal png font "arial,8"
set output 'sample2.png'
set title "Spider Chart for Sample 2" font "arial,14"

plot 'sample2.dat' using 2:3 with filledcurves closed notitle, \
     'sample2.dat' using 2:3 title "Sample 2 legend" with linespoints ls 12, \
     3 notitle with lines linestyle 1, \
     5 notitle with lines linestyle 2

####################Comparison Sample 1 and 2#################################
#set terminal png nocrop enhanced size 1000,600 font "arial,8"
set terminal png font "arial,8"
set output 'comparison-sample1-sample2.png'
set title "Comparison sample 1 and sample 2" font "arial,14"

plot 'sample1.dat' using 2:3 with filledcurves closed notitle, \
     'sample1.dat' using 2:3 title "Sample 1 legend" with linespoints ls 13, \
     'sample2.dat' using 2:3 with filledcurves closed notitle, \
     'sample2.dat' using 2:3 title "Sample 2 legend" with linespoints ls 15, \
     3 notitle with lines linestyle 1, \
     5 notitle with lines linestyle 2

     
     

