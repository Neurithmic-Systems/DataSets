//inputFolderPath  = "c:\\Users\\rod\Dropbox\\NetBeansProjects\\resources\\DataSets\\128x128\\train\\boxing-train\\";
// Get input folder and output folder

inputFolderPath = getDirectory("Choose an Input Directory");
baseOutFileName = File.getName( inputFolderPath  );
outputFolderPath = getDirectory("Choose an Output Directory");	

apertureWid=128;
apertureHt=128;
inputSeqLen=100;

list = getFileList( inputFolderPath  );

// limit to just the number of snippets the user wants to get from the input directory
numSnipsToGet = list.length;						

for (i = 0; i < numSnipsToGet; i++)
{
	print( list[i] );
	InFileName = inputFolderPath  +  list[i];
	run("Raw...", "open=[&InFileName]  image=8-bit  width=[&apertureWid]  height=[&apertureHt]  offset=0  number=[&inputSeqLen]  gap=0  white");
	curImageTitle = getTitle(); 
	run("Make Montage...", "columns=10  rows=10  scale=1  first=1  last=100 increment=1 border=0  font=12");

	print( InFileName );
	saveAs("PNG", outputFolderPath  + list[i]  + ".png");
	close();
}
