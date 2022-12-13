# ParalelProgramming_OpenMPI

Using parallel computing on multiple cores will be efficient in the case of a large matrix. In the case of calculating small matrices for this task, you should not run more than one core. Also, for large matrices, execution speed at 10% Matrix density was fast. 

The algorithm was tested on four processors with large matrix sizes in about three days on AWS Workspace Linux. Unfortunately, it was not possible to fully test for a 4096 matrix, but preliminary results already predict that the performance time will decrease when using more cores (2-4).

## *How to run*
- to run you need to configure pathes in commands.sh
