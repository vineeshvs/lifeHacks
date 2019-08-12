#### Writing a matrix to a file

```matlab
%A = round(rand(6,7)*9)  % Write this to file.
A = [1 2; 3 4]
fid = fopen('Mymatrix.txt','wt');
for ii = 1:size(A,1)
    fprintf(fid,'%g\t',A(ii,:));
    fprintf(fid,'\n');
end
fclose(fid)
```
[Credits](https://in.mathworks.com/matlabcentral/answers/4175-how-to-save-a-matrix-as-text-file)

#### Using Matlab from VLSI Lab, IIT Bombay.

```console
source /vlsi/cad/matlab/matlab.sh
matlab
```
	
#### Running Matlab without GUI

```console
matlab -nodisplay -r name_of_the_matlab_file_without_file_extension
```

* End the Matlab file with 'quit'
[Ref](https://stackoverflow.com/questions/3601786/matlab-run-file-without-opening-gui-then-quit)
