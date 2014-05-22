import argparse
from itertools import izip
import sys
from Bio import SeqIO

def calculate_gc(sequence):
	gc = 0
	at = 0
	for n in sequence:
		if n == 'G' or n == 'C' or n == 'g' or n == 'c':
			gc += 1
		elif n == 'A' or n == 'T' or n == 'a' or n == 't':
			at += 1
	return float(gc) / (float(gc) + float(at))

def filter_se(file_in, threshold):
	with open(file_in) as fin:
		with open(file_in + '_above.fastq', 'w') as fout_above:
			with open(file_in + '_below.fastq', 'w') as fout_below:
				for record in SeqIO.parse(fin, 'fastq-illumina'):
					gc = calculate_gc(record.seq)
					#print('Seq: {}'.format(record.seq))
					#print('GC: {}'.format(calculate_gc(record.seq)))
					if gc > threshold:
						SeqIO.write(record, fout_above, 'fastq-illumina')
					else:
						SeqIO.write(record, fout_below, 'fastq-illumina')

def filter_pe(file_in_1, file_in_2, threshold, mixed='drop'):
	#Mixed describes behavior of paired reads, can be drop, 'above' and 'below'
	#Filtered above gc threshold paired 1 and 2
	above_1 = file_in_1 + '_above.fastq'
	above_2 = file_in_2 + '_above.fastq'
	#Filtered below gc threshold paired 1
	below_1 = file_in_1 + '_below.fastq'
	below_2 = file_in_2 + '_below.fastq'
	with open(file_in_1) as fin1:
		with open(file_in_2) as fin2:
			with open(above_1, 'w') as a1:
				with open(above_2, 'w') as a2:
					with open(below_1, 'w') as b1:
						with open(below_2, 'w') as b2:
							for r1, r2 in izip(SeqIO.parse(fin1, 'fastq-illumina'), SeqIO.parse(fin2, 'fastq-illumina')):
								gc1 = calculate_gc(r1.seq)
								gc2 = calculate_gc(r2.seq)
								#print('GC1: {}, GC2: {}'.format(gc1, gc2))
								if gc1 > threshold and gc2 > threshold:
									SeqIO.write(r1, a1, 'fastq-illumina')
									SeqIO.write(r2, a2, 'fastq-illumina')
								elif gc1 < threshold and gc2 < threshold:
									SeqIO.write(r1, b1, 'fastq-illumina')
									SeqIO.write(r2, b2, 'fastq-illumina')
								else:
									if mixed == 'above':
										SeqIO.write(r1, a1, 'fastq-illumina')
										SeqIO.write(r2, a2, 'fastq-illumina')
									elif mixed == 'below':
										SeqIO.write(r1, b1, 'fastq-illumina')
										SeqIO.write(r2, b2, 'fastq-illumina')


#Execution
if __name__ == '__main__':
	#Create argument parser and fill with the description and parameters data
	parser = argparse.ArgumentParser(description='Script that separates FASTQ reads to different files according to read GC-content')
	parser.add_argument('-d', choices=['se', 'pe'], 		
		required=True,
		help='Type of data (single-end/paired-end) to analyze')
	parser.add_argument('-i', help='Input fastqc for single-end reads')
	parser.add_argument('-i1', help='First set of reads for paired-end reads')
	parser.add_argument('-i2', help='Second set of reads for paired-end reads')
	parser.add_argument('-gc', type=float, required=True, help='GC-separation threshold')

	args = parser.parse_args()

	if args.d == 'se':
		print('Run GC filter for single-end data for input: {} and threshold: {}'.format(args.i, args.gc))
		filter_se(args.i, args.gc)
	elif args.d == 'pe':
		print('Run GC filter for paired-end data for input: {} and {} and threshold: {}'
			.format(args.i1, args.i2, args.gc))
		filter_pe(args.i1, args.i2, args.gc, mixed='below')
	

	



