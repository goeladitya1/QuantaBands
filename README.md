Here are the input files I finally used for the last graphene band structure:

This was done using input file generated from Materials cloud using this CIF file:

https://next-gen.materialsproject.org/materials/mp-990448

K points were changed using gemini help and band structure file was also generated with help of AI. I remember removing smearing and gaussian args from scf input.

PseudoPotential file: 

C.pbesol-n-kjpaw_psl.1.0.0.UPF

1. SCF input and output file (pw.x < pwscf.in > graphenescf.out)

pwscf.in

graphenescf.out

1. Bands input file (pw.x < graphenebands.in >bands.out)

graphenebands.in

bands.out

1. Bands post processing file (bands.x < bands_pp.in > bands_pp.out)

bands_pp.in

bands_pp.out

1. GNU DAT output file

graphene_bands.dat.gnu

1. Plot code using gnuplot: (first type gnuplot in your terminal (install if not there already). then paste the below code)

#Output & Canvas Setup

set terminal pngcairo size 650,850 enhanced font "Helvetica,12"
set output "graphene_bandstruct_final.png"

#Fermi Calibration & Energy Window

E_F = -1.9125
set ylabel "Energy - E_F (eV)" font "Helvetica,13"
set yrange [-18:18]
set ytics -15, 5, 15

#Reciprocal Path Coordinates

k_G1 = 0.0000
k_M  = 0.5774
k_K  = 0.9107
k_G2 = 1.5774

set xrange [k_G1:k_G2]
set xtics ("{/Symbol G}" k_G1, "M" k_M, "K" k_K, "{/Symbol G}" k_G2) font "Helvetica,14"
set xlabel "Wave Vector Path" font "Helvetica,13"

#Background Grid & Dividers

#Enable grid on both x (vertical) and y (horizontal)

set grid xtics ytics lw 1 lc rgb "#e0e0e0" dt 3
set grid back

#Solid dividing lines at high-symmetry points

set arrow 1 from k_M, graph 0 to k_M, graph 1 nohead lc rgb "#777777" lw 1.2 lt 1
set arrow 2 from k_K, graph 0 to k_K, graph 1 nohead lc rgb "#777777" lw 1.2 lt 1

#Fermi level reference (E = 0)

set arrow 3 from graph 0, first 0 to graph 1, first 0 nohead lc rgb "#d62728" lw 1.5 lt 1

# Render Data: Continuous lines + Hollow Circle Markers

#"every 2" prevents the markers from overcrowding on the M -> K segment

plot "graphene_bands.dat.gnu" using 1:($2 - E_F) with lines lw 1.3 lc rgb "#1f77b4" notitle, \
"graphene_bands.dat.gnu" using 1:($2 - E_F) every 2 with points pt 6 ps 0.45 lc rgb "#1f77b4" notitle

set output
