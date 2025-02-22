#! /bin/bash
#SBATCH -p dgx-a100-80g	                # Partition
#SBATCH -N 1                            # Number of nodes
#SBATCH -G 4		                    # Number of GPU
#SBATCH -t 2-00:00:00	                # Set time limit (2day)
#SBATCH -J llava3-finetune		        # Job name
#SBATCH -o log/stdout_finetune.%J	    # stdout file name. %J is the job number.
#SBATCH -e log/stderr_finetune.%J	    # stderr file name. %J is the job number.

singularity exec --nv --bind LLava-LLama3:/LLava-LLama3,workspace:/workspace llava3.sif sh LLava-LLama3/scripts/v1_5/finetune.sh
