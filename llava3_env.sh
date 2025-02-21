#! /bin/bash
#SBATCH -p dgx-a100-80g	            # Partition
#SBATCH -G 1		                # Number of GPU
#SBATCH -t 09:00:00	                # Set time limit (1day)
#SBATCH -J llava-env    		    # Job name
#SBATCH -o log/stdout_env.%J	    # stdout file name. %J is the job number.
#SBATCH -e log/stderr_env.%J	    # stderr file name. %J is the job number.

singularity build --force llava3.sif llava3_image.def
singularity run --nv --bind LLava-LLama3:/LLava-LLama3,workspace:/workspace llava3.sif
