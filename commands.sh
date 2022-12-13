#!/bin/bash

MATRIX_LIST=(128 256 512 1024 2048 4096)
CORE_LIST=(1 2 4)
MATRIX_DENSITY_LIST=(100 10)
LEAF_SIZE_LIST=()
LEAF_DENSITY_LIST=()




for MATRIX in "${MATRIX_LIST[@]}";
do
  echo '-------------------------------------------'
  echo 'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'

  echo 'Mastrix size: ' + $MATRIX

  case $MATRIX in
    128)
      LEAF_DENSITY_LIST=(0.50 0.10 0.03 0.01)
      LEAF_SIZE_LIST=(16 32 64)
      ;;
    256)
      LEAF_DENSITY_LIST=(0.50 0.10 0.01 0.005)
      LEAF_SIZE_LIST=(16 64 128)
      ;;
    512)
      LEAF_DENSITY_LIST=(0.50 0.10 0.05 0.001 0.0025)
      LEAF_SIZE_LIST=(16 128 256)
      ;;
    1024)
      LEAF_DENSITY_LIST=(0.50 0.10 0.05 0.01 0.001)
      LEAF_SIZE_LIST=(64 256 512)
      ;;
    2048)
      LEAF_DENSITY_LIST=(0.50 0.10 0.05 0.01 0.001)
      LEAF_SIZE_LIST=(64 512 1024)
      ;;
    4096)
      LEAF_DENSITY_LIST=(0.10 0.01 0.001 0.0005)
      LEAF_SIZE_LIST=(64 1024 2048)
      ;;
    *)
      echo 'UNKNOWN MATRIX SIZE'
      exit 0
      ;;
  esac

  for CORE in "${CORE_LIST[@]}";
  do
    echo 'CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC'
    echo 'CORE: '+ $CORE
    for DENSITY in "${MATRIX_DENSITY_LIST[@]}";
    do
      echo 'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD'
      echo 'DENSITY: '+ $DENSITY
      for LEAF_SIZE in "${LEAF_SIZE_LIST[@]}";
      do
        echo 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL'
        echo 'LEAF_SIZE: '+ $LEAF_SIZE
        for LEAF_DENSITY in "${LEAF_DENSITY_LIST[@]}";
        do
          echo 'LDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLDLD'
          echo 'LEAF_DENSITY: '+ $LEAF_DENSITY
          mpirun --hostfile /home/mfediuchenko/hostfile -np $CORE java -cp target/lib/log4j-api-2.12.1.jar:target/lib/log4j-core-2.12.1.jar:target/lib/javatuples-1.2.jar:/home/mfediuchenko/IdeaProjects/dap01/target/classes com/mathpar/parallel/dap/adjmatrix/MatrixS/Tests/MatrSAdjMatrixTest -size=$MATRIX -leaf=$LEAF_SIZE -density=$DENSITY -leafdensity=$LEAF_DENSITY -nocheck
        done
      done
    done
  done
done