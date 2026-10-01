set style data dots
set nokey
set xrange [0: 4.03480]
set yrange [-10.59883 :  8.33310]
set arrow from  1.47693, -10.59883 to  1.47693,   8.33310 nohead
set arrow from  2.32956, -10.59883 to  2.32956,   8.33310 nohead
set xtics ("G"  0.00000,"M"  1.47693,"K"  2.32956,"G"  4.03480)
 plot "graphene_band.dat"
