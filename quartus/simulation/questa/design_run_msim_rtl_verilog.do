transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/weight.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/sos.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/movement.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/goal.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/frequency_move.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/frequency_door.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/frequency.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/floor_types.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/emergency.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/door.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/design.v}
vlog -vlog01compat -work work +incdir+/home/fontana/dev/ufba/ENGC40/semestral {/home/fontana/dev/ufba/ENGC40/semestral/buttons.v}

