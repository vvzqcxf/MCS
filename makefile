# HSPICE simulation options
design1 = wnm_r
design2 = snm
design3 = rsnm
file_list = hw1
hspice_bin = hspice
hspice_option = -i

input_file1 = $(design1).sp
input_file2 = $(design2).sp
input_file3 = $(design3).sp

output_file1 = $(design1).lis
output_file2 = $(design2).lis
output_file3 = $(design3).lis

waveform = $(design2).tr0

wv_file = lab01.wv

.PHONY: all run clean

all: run

run:
	@echo "Running HSPICE simulation for $(input_file)..."
	cd hw1; \
	hspice $(hspice_option) $(input_file2) -o $(output_file2) &
	//sx&
	exit

wave:
	cd $(file_list)
	@wv $(waveform) &

clean:
	@echo "Cleaning up simulation files..."
	cd $(file_list); \
	@rm -f $(wv_file) $(output_file).*
