
# Run two jobs in parallel.
cat input_list.txt | parallel -j2 ./printme.sh 

[Ref](https://www.gnu.org/software/parallel/)
