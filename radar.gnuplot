########################################################
# Customizable radar chart for gnuplot
# Author: Olivier Rey
# Email: rey.olivier@gmail.com
# Date: June 2019, adapted from June 2015
# License: Apache 2
########################################################

unset border
set angle degrees
set polar
set grid polar 18
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

### Range of graph
set xrange [-5.5:5.5]
set yrange [-5.5:5.5]

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

### This places a label on the outside
set_label(x, text) = sprintf("set label '%s' at (5.5*cos(%f)), (5.5*sin(%f)) center", text, x, x)

### Define the number of axes
axisnumber = 7

anglestep = 360/axisnumber
start = anglestep/2

### Here all labels are created
eval set_label(start, "Label01")
eval set_label(start + anglestep, "Label02")
eval set_label(start + anglestep*2, "Label03")
eval set_label(start + anglestep*3, "Label04")
eval set_label(start + anglestep*4, "Label05")
eval set_label(start + anglestep*5, "Label06")
eval set_label(start + anglestep*6, "Label07")
#eval set_label(start + anglestep*7, "Label08")
#eval set_label(start + anglestep*8, "Label09")
#eval set_label(start + anglestep*9, "Label10")
#eval set_label(start + anglestep*10, "Label11")
#eval set_label(start + anglestep*11, "Label12")
#eval set_label(start + anglestep*12, "Label13")
#eval set_label(start + anglestep*13, "Label14")
#eval set_label(start + anglestep*14, "Label15")
#eval set_label(start + anglestep*15, "Label16")
#eval set_label(start + anglestep*16, "Label17")
#eval set_label(start + anglestep*17, "Label18")
#eval set_label(start + anglestep*18, "Label19")
#eval set_label(start + anglestep*29, "Label20")


#set style fill transparent solid 0.5 noborder
set style fill transparent pattern 4 bo

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

     
     

