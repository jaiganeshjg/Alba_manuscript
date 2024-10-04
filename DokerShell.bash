docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Lei_Inf_alba1_2_119.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/A4IA34_lei.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/tox_go_1_120.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/B9PQI5_taxg.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Sa_So.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/D0KTT2_ss.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Tr_Bru.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/Q385X2_tryb.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Or_Sa_41_144.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/Q94E63_orsa.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Lei_Inf_alba3_1_93.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/Q962W8_lei.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Ae_Pe.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/Q9YAW1_aep.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/PfAlba3.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/alba3_pf.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/PfAlba2_9_158.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/alba2_pf.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/PfAlba4.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/alba4_pf.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/PfAlba5.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/alba5_pf.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/PfAlba1_1_114.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/alba1_pf.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Ca_br_1_143.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/CAP22854_CaBr.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Br_Ma.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/CDP95722_Brma.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Pi_Pr_31_154.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/KAG1944584_PiPr.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Ca_la_bac.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/RKY63913_calabac.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Pa_Mi_457_569.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/RLN35084_pamch.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/De_bac.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/RZB33274_debac.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Ci_Ce_19_143.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/VVC33431_CiCe.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/St_Ra_6_131.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/XP_024507562_StRa.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Co_Mi_49_218.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/ATY61034_CoMiFu.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Rh_So_1_164.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/CUA76030_rhsoFU.txt
docker run --rm \
  -v $HOME/blastdb:/blast/blastdb:ro -v $HOME/blastdb_custom:/blast/blastdb_custom:ro \
  -v $HOME/queries:/blast/queries:ro \
  -v $HOME/results:/blast/results:rw \
  ncbi/blast \
psiblast -db nr -query /blast/queries/Gy_An_1_161.fasta -num_iterations=5 -max_target_seqs=10000 -evalue=10 -num_threads 8 -outfmt '6 qseqid sseqid stitle qstart qend sstart send pident evalue qcovs gaps bitscore length sseq sacc sgi staxid ssciname scomname sskingdom' -out /blast/results/KAE9410662_GyanFU.txt